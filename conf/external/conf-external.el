(global-set-key (kbd "C-c t") 'google-translate-at-point)
(global-set-key (kbd "C-c T") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c M-t") 'google-translate-query-translate)
(global-set-key (kbd "C-c M-T") 'google-translate-query-translate-reverse)

(setq google-translate-output-destination nil)
(setq google-translate-show-phonetic t)
(setq google-translate-pop-up-buffer-set-focus t)
;; (setq google-translate-enable-ido-completion nil)

;; (setq google-translate-translation-directions-alist
;;       '(("en" . "ko") ("en" . "ja"))

(setq google-translate-default-target-language "ko")

;; (set-face-attribute 'google-translate-text-face nil :height 1.0)
;; (set-face-attribute 'google-translate-translation-face nil :height 1.0)
;; (set-face-attribute 'google-translate-suggestion-face "underline")

