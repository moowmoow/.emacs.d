
(load-theme 'paganini t)

(custom-theme-set-faces
 'paganini
 `(org-block ((t (:foreground "#5fafd7" :background "#3a3a3a"))))
 `(org-block-background ((t (:foreground nil :background "#3a3a3a"))))
 `(org-block-begin-line ((t (:foreground "#eeeeee" :background "#005f87"))))
 `(org-block-end-line ((t (:foreground "#4e4e4e" :background "#3a3a3a"))))

 ;; Flycheck
 `(flycheck-error ((t (:background "#dd0000" :foreground "#eeeeee" :bold t :underline t))))
 `(flycheck-warnline ((t (:background "#ff8700" :foreground "#eeeeee" :bold t :underline t))))
 )

;; theme setting
;;(load-theme 'monokai t)

;;(yellow-light "#F8F8F2")

;; (let (
;;       (blue-light "#89BDFF")
;;       (black "#000000")
;;       (gray "#595959")
;;       (gray-darker "#383830")
;;       (gray-darkest "#141411")
;;       (gray-lightest "#595959")
;;       (gray-light "#E6E6E6")
;;       (green "#A6E22A")
;;       (green-light "#A6E22E")
;; n      (grey-dark "#272822")
;;       (magenta "#F92672")
;;       (purple "#AE81FF")
;;       (purple-light "#FD5FF1")

;;       ;; green
;;       (lime "#00FF00")

;;       ;; red color
;;       (red "#FF0000")
;;       (maroon "#800000")

;;       ;; white color
;;       (white "#FFFFFF")
;;       (snow "#FFFAFA")

;;       ;; yellow color
;;       (yellow "#FFFF00")
;;       (yellow-dark "#75715E")
;;       (yellow-light "#F8F8F2")
;;       (salmon "#FA8072")
;;       (orangered "#FF4500")
;;       (gold "#FFD700")
;;       (orange "#FFA500")
;;       (darkorange "#FF8C00")
;;       (yellowgreen "#9ACD32")
;;       (pink "#FFC0CD")
;;       (deeppink "#FF1493")
;;       (darkgreen "#006400")
;;       (cyan "#87FFFF")
;;       )
;;   (custom-theme-set-faces
;;    'monokai
;;    ;; Frame
;;    `(default ((t (:foreground ,gray-light :background ,black))))
;;    `(hl-line ((t (:foreground ,black :background ,yellow))))
;;    `(cursor ((t (:foreground ,black :background ,black))))
;; ;;   `(hl-line-face ((t (:background ,black))))
;;    `(minibuffer-prompt ((t (:foreground ,yellow))))
;;    `(modeline ((t (:background ,yellow :foreground ,gray-light))))
;;    `(region ((t (:foreground ,white :background ,maroon))))
;;    `(show-paren-match-face ((t (:background ,red))))
;;    ;; Main
;;    `(font-lock-constant-face ((t (:foreground ,blue-light))))
;;    `(font-lock-builtin-face ((t (:foreground ,green))))
;;    `(font-lock-comment-face ((t (:foreground ,gray))))
;;    `(font-lock-doc-string-face ((t (:foreground ,gray))))

;;    `(font-lock-keyword-face ((t (:foreground ,magenta))))
;;    `(font-lock-string-face ((t (:foreground ,snow))))
   
;;    `(font-lock-type-face ((t (:foreground ,yellowgreen, :bold t))))
;;    `(font-lock-function-name-face ((t (:foreground ,yellow :bold t))))
;;    `(font-lock-variable-name-face ((t (:foreground ,orange :bold t))))
   
;;    `(font-lock-warning-face ((t (:bold t :foreground ,purple-light))))
;;    ;; CUA
;;    `(cua-rectangle ((t (:background ,gray-darkest))))
;;    ;; IDO
;;    `(ido-first-match ((t (:foreground ,purple))))
;;    `(ido-only-match ((t (:foreground ,green))))
;;    `(ido-subdir ((t (:foreground ,blue-light))))
;;    ;; ECB
;;    `(ecb-default-highlight-face ((t (:foreground ,green))))
;;    ;; Whitespace
;;    `(whitespace-space ((t (:foreground ,gray))))
;;    ;; Yasnippet
;;    `(yas/field-highlight-face ((t (:background ,gray-darker))))
;;    ;; volatile-highlights
;;    `(vhl/default-face ((t (:foreground ,black :background ,salmon))))
;;    ;; highlight-symbol
;;    `(highlight-symbol-face ((t (:foreground ,black :background ,yellow))))
;;    ;; swiper
;;    ;; `(swiper-line-face ((t (:background ,yellow))))
;;    ;; `(swiper-match-face1 ((t (:background ,yellow))))
;;    ;; `(swiper-match-face2 ((t (:background ,yellow))))
;;    ;; `(swiper-match-face3 ((t (:background ,yellow))))
;;    ;; `(swiper-match-face4 ((t (:background ,yellow))))
;;    ;; flycheck
;;    `(flycheck-error ((t (:background ,red :foreground ,white :underline t :bold t))))
;;    `(flycheck-warnline ((t (:background ,orangered :foreground ,white :underline t :bold t))))
;;    )
;;   )


;(require 'moe-theme)


;; Show highlighted buffer-id as decoration. (Default: nil)
;;(setq moe-theme-highlight-buffer-id t)

;; Resize titles (optional).
;;(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
;;(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
;;(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Choose a color for mode-line.(Default: blue)
;(moe-theme-set-color 'yellow)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
;;(moe-dark)

;(powerline-moe-theme)


;;(require 'spacemacs-theme)

;;(load-theme 'spacemacs-dark t)

;;(load-theme 'zenburn t)
;;
;;(custom-theme-set-faces
;; 'zenburn
;; '(default ((t (:foreground "orange" :background "black")))))
