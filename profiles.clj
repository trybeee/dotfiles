{:user  {:dependencies [[alembic "0.3.2"]
                        [org.clojure/tools.nrepl "0.2.12"] ]
         :plugins  [[lein-ancient "0.6.10"]
                    [lein-cljfmt "0.5.6"]
                    [lein-kibit "0.1.2"]
                    [lein-hiera "0.9.5"]
                    [lein-vanity "0.2.0"]
                    [jonase/eastwood "0.2.3"]
                    [venantius/yagni "0.1.4"]
                    [venantius/ultra "0.5.0"]]
         :aliases {"anc" ^{:doc "Check all dependencies for updates"}
                   ["do"
                    ["ancient" "check-profiles" ":all" ":check-clojure"]
                    ["ancient" ":all" ":check-clojure"]]
                   "anc-up" ^{:doc "Upgrade all dependencies interactively"}
                   ["do"
                    ["ancient" "upgrade" ":interactive" ":all" ":check-clojure"]
                    ["ancient" "upgrade-profiles" ":interactive" ":all" ":check-clojure"]]
                   "dev" ^{:doc "Run development repl"}
                   ["do" "clean" ["repl" ":headless"]]}
         :ultra {:color-scheme :solarized_dark}}
 :repl {:plugins [[cider/cider-nrepl "0.14.0-SNAPSHOT"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]]}}

