{:user  {:dependencies [[alembic "0.3.2"]
                        ]
         :plugins  [[jonase/eastwood "0.2.3"]
                    [lein-ancient "0.6.10"]
                    [lein-bikeshed "0.5.0"]
                    [lein-cljfmt "0.5.6"]
                    [lein-kibit "0.1.2"]
                    [lein-hiera "0.9.5"]
                    [lein-nvd "0.5.1"]
                    [lein-re-frisk "0.5.3"]
                    [lein-vanity "0.2.0"]
                    [lein-localrepo "0.5.4"]]
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
 }

