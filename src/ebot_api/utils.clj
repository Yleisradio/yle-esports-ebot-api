(ns ebot-api.utils
  (:require
    [edn-config.core :refer [env]]))


(def current-env
  (or (env :environment)
      "dev"))


(defn get-by-key [key]
  ((keyword key) ((keyword current-env) env) {}))

(def current-version
  (let [version (or (:package.version env)
                    (:packages-api-version env))]
    (str current-env " - " version)))