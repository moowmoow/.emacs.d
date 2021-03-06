;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : js2
;;
;; GROUP   : Programming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; js2-mode setting
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : tern
;;
;; GROUP   : Programming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (auto-complete-mode)))

(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (auto-complete-mode)))

(eval-after-load 'tern
  '(progn
    (require 'tern-auto-complete)
    (setq tern-ac-on-dot t)
    (tern-ac-setup)))
