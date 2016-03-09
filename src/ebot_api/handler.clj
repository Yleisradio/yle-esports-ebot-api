(ns ebot-api.handler
  (:require [compojure.api.sweet :refer :all]
            [ring.util.http-response :refer :all]
            [schema.core :as s]
            [korma.core :refer [with select where order limit exec-raw]]
            [korma.db :refer [defdb mysql]]
            [cheshire.core :as cheshire]
            [ring.middleware.cors :refer [wrap-cors]]
            [ebot-api.entities :refer :all]
            [edn-config.core :refer [env]]
            [ebot-api.utils :refer [get-by-key current-version]]
            [clojure.tools.logging :refer [info error]]
            [clojure.string :refer :all])
  (:gen-class))


(defn startup []
  (info (str "Api started with version:" current-version)))

(defdb db (mysql (get-by-key :db)))

(defn get-team [id]
  (select teams (with players) (where {:id id})))

(defn get-teams [] (select teams (with players) (order :name :ASC)))

(defn filter-players [filters match]
  (if filters
    (let [newplayers (seq (remove #(contains? filters (:pseudo %)) (:players match)))
          newmatch (assoc match :players newplayers)]
      newmatch)
    match))

(defn get-matchs [id]
  (let [match (first (select matchs (with round_summary) (with players (with players_snapshot)) (where {:id id})))
        real (assoc match :teams [(get-team (get match :team_a)) (get-team (get match :team_b))])]
    real))

(defn get-matchs-filter [id filters]
  (filter-players filters (get-matchs id)))




(defn get-all-matchs [seasonid]
  (select matchs (where {:season_id seasonid}) (order :startdate :DESC) (limit 20)))

(defn get-round [id]
  (select round_summary (where {:id id})))

(defn get-rounds [matchid]
  (select round_summary (where {:match_id matchid}) (order :round_id :DESC)))



(def playersumSql "SELECT player_id, sum(nb_kill) as nb_kill,sum(assist) as assist, sum(death) as death, sum(defuse) as defuse, sum(bombe) as bombe,sum(point) as point, sum(hs) as hs, sum(tk) as tk, sum(nb1) as nb1, sum(nb2) as nb2, sum(nb3) as nb3, sum(nb4) as nb4, sum(nb5) as nb5, sum(nb1kill) as nb1kill,sum(nb2kill) as nb2kill,sum(nb3kill) as nb3kill,sum(nb4kill) as nb4kill,sum(nb5kill) as nb5kill, sum(pluskill) as pluskill,sum(firstkill) as firstkill FROM players_snapshot group by player_id order by player_id")
(def playersumSqlwithSeason "SELECT p.steamid, max(p.pseudo) as nick,sum(nb_kill) as nb_kill,sum(assist) as assist, sum(death) as death, sum(defuse) as defuse, sum(bombe) as bombe,sum(point) as point, sum(hs) as hs, sum(tk) as tk, sum(nb1) as nb1, sum(nb2) as nb2, sum(nb3) as nb3, sum(nb4) as nb4, sum(nb5) as nb5, sum(nb1kill) as nb1kill,sum(nb2kill) as nb2kill,sum(nb3kill) as nb3kill,sum(nb4kill) as nb4kill,sum(nb5kill) as nb5kill, sum(pluskill) as pluskill,sum(firstkill) as firstkill FROM players p, matchs m where p.match_id = m.id and m.season_id = ? group by steamid")

(defn get-playersummary [seasonid]
  (exec-raw [playersumSqlwithSeason [seasonid]] :results))

(def playersumSqlWithId "SELECT player_id, sum(nb_kill) as nb_kill,sum(assist) as assist, sum(death) as death, sum(defuse) as defuse, sum(bombe) as bombe,sum(point) as point, sum(hs) as hs, sum(tk) as tk, sum(nb1) as nb1, sum(nb2) as nb2, sum(nb3) as nb3, sum(nb4) as nb4, sum(nb5) as nb5, sum(nb1kill) as nb1kill,sum(nb2kill) as nb2kill,sum(nb3kill) as nb3kill,sum(nb4kill) as nb4kill,sum(nb5kill) as nb5kill, sum(pluskill) as pluskill,sum(firstkill) as firstkill FROM players_snapshot where player_id=? group by player_id")
(def playersumSqlWithIdAndSeason "SELECT steamid, max(pseudo) as nick,sum(nb_kill) as nb_kill,sum(assist) as assist, sum(death) as death, sum(defuse) as defuse, sum(bombe) as bombe,sum(point) as point, sum(hs) as hs, sum(tk) as tk, sum(nb1) as nb1, sum(nb2) as nb2, sum(nb3) as nb3, sum(nb4) as nb4, sum(nb5) as nb5, sum(nb1kill) as nb1kill,sum(nb2kill) as nb2kill,sum(nb3kill) as nb3kill,sum(nb4kill) as nb4kill,sum(nb5kill) as nb5kill, sum(pluskill) as pluskill,sum(firstkill) as firstkill FROM players p, matchs m where p.steamid = ? and p.match_id = m.id and m.season_id = ? group by p.steamid")

(defn get-playersummaryByid [steamid seasonid]
  (let [playerSummary (exec-raw [playersumSqlWithIdAndSeason [steamid seasonid]] :results)]
    (if-not playerSummary {} (first playerSummary))))

(defn get-player [steamid]
  (select players (where {:steamid steamid})))

(defn get-map [id]
  (select maps (where {:id id})))

(defn get-maps [matchid]
  (select maps (where {:match_id matchid}) (order :map_name :ASC)))

(def get-seasons
  (select seasons (with matchs) (order :start :DESC) (limit 20)))


(defapi app
        (middlewares [(wrap-cors :access-control-allow-origin [#".*"]
                                 :access-control-allow-methods [:get :options]
                                 :access-control-allow-headers ["Origin" "X-Requested-With"
                                                                "Content-Type" "Accept"])]
                     (swagger-ui)
                     (swagger-docs
                       {:info {:title       "Ebot-api"
                               :description "eBot api"}
                        :tags [{:name "api", :description "EBOT rest api"}]})
                     (context* "/v1" []
                               (GET* "/ping" []
                                     :summary "ping"
                                     (ok {:status 200 :version current-version})))
                     (context* "/api" []
                               :tags ["api"]
                               (GET* "/matches/:seasonid" []
                                     :summary "Get all matches"
                                     :path-params [seasonid :- String]
                                     (ok (get-all-matchs seasonid)))
                               (GET* "/player/:steamid" []
                                     :summary "Get player with steamid"
                                     :path-params [steamid :- String]
                                     (ok (get-player steamid)))
                               (GET* "/playersummary/:seasonid" []
                                     :summary "Get player summary for all matches for given season"
                                     :path-params [seasonid :- Long]
                                     (ok (get-playersummary seasonid)))
                               (GET* "/playersummary/:seasonid/:steamid" []
                                     :summary "Get summary for given player for all matches for given season"
                                     :path-params [steamid :- String
                                                   seasonid :- Long
                                                   ]
                                     (ok (get-playersummaryByid steamid seasonid)))
                               (GET* "/match/:id" []
                                     :summary "Get match with id"
                                     :query-params [{ filters :- String nil}]
                                     :path-params [id :- Long]
                                     (if filters
                                     (ok (get-matchs-filter id (set (split filters #","))))
                                     (ok (get-matchs id))))
                               (GET* "/rounds/:matchid" []
                                     :summary "Get rounds with match id"
                                     :path-params [matchid :- Long]
                                     (ok (get-rounds matchid)))
                               (GET* "/round/:id" []
                                     :summary "Get round with id"
                                     :path-params [id :- Long]
                                     (ok (get-round id)))
                               (GET* "/team/:id" []
                                     :summary "Get team with id"
                                     :path-params [id :- Long]
                                     (ok (get-team id)))
                               (GET* "/teams" []
                                     :summary "Get all teams"
                                     (ok (get-teams)))
                               (GET* "/maps/:matchid" []
                                     :summary "Get all maps"
                                     :path-params [matchid :- Long]
                                     (ok (get-maps matchid)))
                               (GET* "/map/:id" []
                                     :summary "Get map with id"
                                     :path-params [id :- Long]
                                     (ok (get-map id)))
                               (GET* "/seasons" []
                                     :summary "Get all seasons"
                                     (ok get-seasons))

                               )))
