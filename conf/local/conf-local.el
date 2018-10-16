;; font setting
;; (set-face-font 'default "Bitstream Vera Sans Mono")
;; (set-face-attribute 'default nil :height 115)
;; (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding" :size 20))

;;(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 130)
(set-face-attribute 'default nil :family "Bitstream Vera Sans Mono" :height 115)
(set-fontset-font nil 'hangul (font-spec :family "D2Coding" :pixelsize 14))
(setq face-font-rescale-alist '(("D2Coding" . 1.2)))
;;(setq-default line-spacing 6)
