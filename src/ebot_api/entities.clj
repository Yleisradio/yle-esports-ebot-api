(ns ebot-api.entities
  (:require [korma.core :refer :all]
            [korma.db :refer :all]
            ))

(declare players_snapshot maps players players round_summary round_summary teams matchs seasons)

(defentity players_snapshot)

(defentity maps)

(defentity players)

(defentity players
           (has-many players_snapshot {:fk :player_id}))

(defentity round_summary)

(defentity round
           (has-many round_summary)
           )

(defentity teams
           (has-many players {:fk :team}))




(defentity matchs

           (has-many players {:fk :match_id})
           (has-many round_summary {:fk :match_id})

           (transform (fn [{config_password :config_password :as v}]
                        (if config_password
                          (assoc v :config_password "") v)))
           (transform (fn [{config_authkey :config_authkey :as v}]
                        (if config_authkey
                          (assoc v :config_authkey "") v)))
           (transform (fn [{ip :ip :as v}]
                        (if ip
                          (assoc v :ip "") v)))
           )

(defentity seasons
           (has-many matchs {:fk :season_id}))
