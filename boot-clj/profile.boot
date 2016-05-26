(defmacro ^:private r [sym] `(resolve '~sym))

(deftask cider "CIDER profile"
  []
  (require 'boot.repl)
  (swap! @(r boot.repl/*default-dependencies*)
         into '[[org.clojure/tools.nrepl "0.2.12"]
                [cider/cider-nrepl "0.11.0"]
                [refactor-nrepl "2.2.0"]])
  (swap! @(r boot.repl/*default-middleware*)
         into '[cider.nrepl/cider-middleware
                refactor-nrepl.middleware/wrap-refactor]))

;; Local Variables:
;; mode: clojure
;; End:
