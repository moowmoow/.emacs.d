;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : ejc-sql
;;
;; GROUP   : ejc sql
;; SITE    : https://github.com/kostafey/ejc-sql
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ejc-sql)

(add-hook 'ejc-sql-hook
          (lambda()
            ;; (setq cider-lein-parameters "repl :headless :host localhost")
            (ejc-set-rows-limit 1000)))
