
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")

;;(set-language-environment "Korean")
(setq default-input-method "korean-hangul390")
(setq default-korean-keyboard "390")

;; input 메서드 변경 단축키 설정
(global-set-key (kbd "<Hangul>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "S-SPC") 'toggle-input-method)
(global-set-key (kbd "C-S-SPC") 'toggle-input-method)

;; 기본 탭 사이즈 설정
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(delete-selection-mode t)

;; diff-mode에서 중요한 화이트스페이스 보이게 하기
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(face
                                          tabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : duplicate-thing
;;
;; SITE    : https://github.com/ongaeshi/duplicate-thing
;;
;; duplicate-thing.el is Emacs lisp. Easy duplicate line or region, with comment out.
;;
;; 1. Duplicate current line.
;; 2. Duplicate a selection when selection is active.
;; 3. Only C-u, replicate, comment out the range.
;; 4. Numerical prefix is specified as 'C-u 5': do multiple times repeatedly.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-S-c") 'duplicate-thing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : electric-pair-mode
;;
;; GROUP   : Editing > Matching > Paren Matching > Paren Showing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : electric-pair-mode
;;
;; GROUP   : Editing > Electricity
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(electric-pair-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : clean-aindent-mode
;;
;; GROUP   : Editing > Indent > Clean Aindent
;; SITE    : https://github.com/pmarinov/clean-aindent-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'prog-mode-hook 'clean-aindent-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : volatile-highlights-mode
;;
;; GROUP   : Editing > Volatile Highlights
;; SITE    : http://www.emacswiki.org/emacs/VolatileHighlights
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(volatile-highlights-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : smartparens
;;
;; GROUP   : Editing > Smartparens
;; SITE    : https://github.com/Fuco1/smartparens
;;           https://github.com/Fuco1/smartparens/wiki
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entrie-symbol nil)
(sp-use-paredit-bindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : swiper
;;
;; GROUP   : Editing > Matching > Swiper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper-all)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : iedit
;;
;; GROUP   : Editing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-;") 'iedit-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : Yasnippet
;;
;; GROUP   : Editing > Yasnippet
;; SITE    : https://github.com/capitaomorte/yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(yas-global-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : undo-tree
;;
;; GROUP   : Editing > Undo > Undo Tree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-undo-tree-mode)
(add-hook 'prog-mode-hook #'undo-tree-mode)
(add-hook 'text-mode-hook #'undo-tree-mode)
