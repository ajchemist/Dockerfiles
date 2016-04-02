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

(set-env! :dependencies
          #(into % '[[org.clojure/tools.namespace "0.2.11" :scope "test"]
                     [turingmind.private/clojure "20160328" :scope "test"]]))

(require '[clojure.tools.namespace.repl :as ns-repl])
#_(apply ns-repl/set-refresh-dirs (get-env :directories))

(use 'turingmind.clojure.core)

;; Local Variables:
;; mode: clojure
;; End:
