;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : web-mode
;;
;; GROUP   : Text > Outlines > Org > Babel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; plant-uml setting
(setq plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml/plantuml.1.2018.11.jar"))
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml/plantuml.1.2018.11.jar"))

(setq org-confirm-babel-evalute nil)

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))

(add-hook 'org-babel-after-execute-hook
          (lambda ()
            (when org-inline-image-overlays
              (org-redisplay-inline-images))))
