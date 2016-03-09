(defproject esports-ebot-api "0.1.0-SNAPSHOT"
  :description "Esports ebot api for gaming statistics"
  :url "https://github.com/Yleisradio/yle-esports-ebot-api"
  :dependencies [[org.clojure/clojure "1.7.0"]
                 [clj-time "0.11.0"]                        ; required due to bug in lein-ring
                 [metosin/compojure-api "0.24.5"]
                 [korma "0.4.2"]
                 [mysql/mysql-connector-java "5.1.6"]
                 [ring-cors "0.1.7"]
                 [edn-config "0.3"]
                 [org.clojure/tools.logging "0.3.1"]
                 [org.slf4j/slf4j-api "1.7.10"]
                 [ch.qos.logback/logback-core "1.1.3"]
                 [ch.qos.logback/logback-classic "1.1.3"]
                 [net.logstash.logback/logstash-logback-encoder "4.5.1"]
                 [org.clojure/tools.trace "0.7.8"]
                 [new-reliquary "0.1.2"]
                 [org.clojure/tools.logging "0.3.1"]
                 ]
  :repositories [["releases" "http://appwarehouse.api-t.yle.fi:8080/artifactory/libs-release-local"]]
  :ring {
         :handler ebot-api.handler/app
         :init    ebot-api.handler/startup
         :port    8080
         }
  :license {:name "The MIT License (MIT)"
            :url  "http://opensource.org/licenses/MIT"}
  :profiles {:dev  {:dependencies [[javax.servlet/servlet-api "2.5"]
                                   [cheshire "5.3.1"]
                                   [ring-mock "0.1.5"]]
                    :plugins      [[lein-ring "0.9.6"]] :resource-paths ["resources"]}
             :test {:resource-paths ["resources"]}
             :prod {:resource-paths ["resources"]}
             })
