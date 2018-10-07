;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : web-mode
;;
;; GROUP   : Programming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; web-mode setting
;(setq web-mode-tag-auto-close-style 0)
(setq web-mode-markup-indent-offset 2)    ; 태그 들여쓰기
(setq web-mode-css-indent-offset 2)       ; css 들여쓰기 
(setq web-mode-code-indent-offset 2)      ; 스타일, 스크립트 들여쓰기
(setq web-mode-style-padding 1)           ; 스타일 패팅
(setq web-mode-script-padding 1)          ; 스크립트 패딩
(setq web-mode-block-padding 0)           ; 블록 패딩
(setq web-mode-comment-style 2)           ; 주석 스ㅌ타일
(setq web-mode-enable-auto-pairing t)     ; 자동 짝 만들기
(setq web-mode-enable-css-colorization t) ; css 컬러링

;;(add-to-list 'web-mode-indentation-params '"lineup-args" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-calls" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-concats" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-ternary" . nil))

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;;(setq auto-mode-alist
;;      (append '(
;;                ("\\.\\(html\\|xhtml\\|shtml\\|tpl\\)\\'" . web-mode)
;;                ("\\.\\(php\\|phtml\\)\\'" . php-mode)
;;                )
;;              auto-mode-alist))
