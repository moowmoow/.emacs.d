(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-parameters "repl :headless :host localhost")
 '(package-selected-packages
   (quote
    (dap-mode lsp-ui company-lsp use-package lsp-java expand-region rainbow-mode discover-my-major highlight-symbol highlight-numbers paganini-theme flx-ido clean-aindent-mode duplicate-thing plantuml-mode ejc-sql session ido-vertical-mode edbi monokai-theme org-wiki jade-mode gradle-mode eyebrowse groovy-mode helm-descbinds meghanada xref-js2 wgrep undo-tree tern tern-auto-complete tern-context-coloring org-bullets stylus-mode js2-refactor js2-mode markdown-mode web-mode prodigy nodejs-repl neotree which-key iedit multi-term counsel-projectile company magit projectile counsel avy swiper))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; package setting
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; lang and input setting
(set-language-environment "Korean")
(setq default-input-method "korean-hangul390")
(setq default-korean-keyboard "390")
(global-set-key (kbd "<kana>") 'toggle-input-method)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "C-S-SPC") 'toggle-input-method)

(prefer-coding-system 'utf-8)

;; frame setting
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 200))
(set-frame-position (selected-frame) 80 20)

;; font setting
(set-face-font 'default "Bitstream Vera Sans Mono")
(set-face-attribute 'default nil :height 115)
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding" :size 20))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; program link
;(setq find-program "d:\\tools\\cygwin64\\bin\\find.exe")
;(setq grep-program "d:\\tools\\cygwin64\\bin\\grep.exe")

;; basic setting
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-hl-line-mode t)
;;(global-linum-mode t)
(add-hook 'prog-mode-hook 'linum-mode) ;; 프로그램 모드에서만 행번호 표시
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace t)))
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)
(column-number-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(electric-pair-mode t)
(defalias 'list-buffers 'ibuffer)

;; file size 제한
(setq large-file-warning-threshold 104857600)
(setq gc-cons-threshold 104857600)

;; Recently Visited Files
(setq recentf-max-saved-items 200)
(setq recentf-max-menu-items 15)
(recentf-mode 1)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-c f") 'recentf-ido-find-file)

;;(desktop-save-mode t)
(savehist-mode t)
(add-to-list 'savehist-additional-variables 'kill-ring)

(setq session-jump-undo-threshold 80)
(global-set-key (kbd "C-c q") 'session-jump-to-last-change)

;; backup file setting
(setq make-backup-file nil)
(setq auto-save-default nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; dired
(setq dired-dwim-target t) ;; 다른 dired buffer가 다른 윈도우에 표시되고 있다면 rename / copy를 위한 타켓으로 그 디렉토리를 사용
(setq dired-recursive-copies 'alway)
(setq dired-recursive-deletes 'top)
(setq dired-listing-switches "-lha")

(add-hook 'dired-mode-hook 'auto-revert-mode)
(when (not (eq system-type 'windows-nt))
  (setq dired-listing-switches "-lha --group-directories-first"))

;; theme setting
;;(load-theme 'monokai t)
(load-theme 'paganini t)
(nyan-mode t)

;; custom function
;; Delete File and Buffer
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c D") 'delete-file-and-buffer)

;; Move Current Line Up or Down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "C-M-<up>") 'move-line-up)
(global-set-key (kbd "C-M-<down>") 'move-line-down)

;; Rename File and Buffer
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(global-set-key (kbd "C-c r") 'rename-file-and-buffer)

;; Switch to Previous Buffer
(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)

;; Go to Column
(defun go-to-column (column)
  (interactive "ncolumn: ")
  (move-to-column column t))

(global-set-key (kbd "M-g M-c") 'go-to-column)

;; projectile mode setting
(projectile-mode t)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)
(counsel-projectile-mode t)

;; swiper mode setting
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper-all)

;; ivy mode setting
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; ivy-based interface to standard commands
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

;; Ivy-based interface to shell and system tools
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;; Ivy-resume and other commands
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; avy short-cut setting
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "C-c C-j") 'avy-resume)

;; iedit short-cut setting
(global-set-key (kbd "C-;") 'iedit-mode)

;; eyebrowse mode setting
(eyebrowse-mode t)

;; undo-tree mode setting
(global-undo-tree-mode)

;; org-bullets mode setting
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))

;; org-wiki mode setting
(require 'org-wiki)
(setq org-wiki-location-list '("/mnt/document/org-wiki/it"))
(setq org-wiki-location (car org-wiki-location-list))

(defalias 'w-h #'org-wiki-helm)
(defalias 'w-s #'org-wiki-switch)
(defalias 'w-sr #'org-wiki-switch-root)
(defalias 'w-hf #'org-wiki-helm-frame)
(defalias 'w-hr #'org-wiki-helm-read-only)
(defalias 'w-i #'org-wiki-index)
(defalias 'w-in #'org-wiki-insert-new)
(defalias 'w-il #'org-wiki-insert-link)
(defalias 'w-ad #'org-wiki-asset-dired)
(defalias 'og2h #'org-html-export-to-html)
(defalias 'w-close #'org-wiki-close)

;; which-key mode setting
(which-key-mode t)

;; meghanada mode setting
(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq tab-width 4)
            (setq c-basic-offset 4)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

(cond ((eq system-type 'windows-nt)
       (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
       (setq meghanada-maven-path "mvn.cmd"))
      (t
       (setq meghanada-java-path "java")
       (setq meghanada-maven-path "mvn")))

(global-set-key (kbd "C-c C-t r") 'meghanada-reference)
(global-set-key (kbd "C-c C-t i") 'meghanada-typeinfo)
(global-set-key (kbd "C-c C-c m") 'meghanada-exec-main)
(global-set-key (kbd "C-c C-v s") 'meghanada-jump-symbol)


;; helm-descbinds mode setting
(global-set-key (kbd "C-h b") 'helm-descbinds)

;; js2-mode setting
;;(add-to-list 'auto-mode-alist '("\\.js\\" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (auto-complete-mode)))
(eval-after-load 'tern
  '(progn
    (require 'tern-auto-complete)
    (setq tern-ac-on-dot t)
    (tern-ac-setup)))

;; org-mode setting
;;(setq org-src-fontify-natively t)
;;(org-block-begin-line ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))
;;(org-block-background ((t (:background "#FFFFEA"))))
;;(org-block-end-line ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))

;; markdown-mode setting

(setq org-highlight-latex-and-related '(latex))

(require 'ejc-sql)
(setq cider-lein-parameters "repl :headless :host localhost")

;; org-babel setting
(with-eval-after-load 'org
(org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
(plantuml . t)
)))

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

;; web-mode setting
;(setq web-mode-tag-auto-close-style 0)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)
(setq web-mode-block-padding 0)

;;(add-to-list 'web-mode-indentation-params '"lineup-args" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-calls" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-concats" . nil))
;;(add-to-list 'web-mode-indentation-params '"lineup-ternary" . nil))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; magit setting
(global-magit-file-mode t)

;; golden-ratio setting
(require 'golden-ratio)

(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

;; 다음 모드에서는 golden-raio를 활성화하지 않습니다.
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "gdb-locals-mode"
                                   "gdb-registers-mode"
                                   "gdb-breakpoints-mode"
                                   "gdb-threads-mode"
                                   "gdb-frames-mode"
                                   "gdb-inferior-io-mode"
                                   "gud-mode"
                                   "gdb-inferior-io-mode"
                                   "gdb-disassembly-mode"
                                   "gdb-memory-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mode" "dired-mode"))

(golden-ratio-mode)

;;diff-mode에서 중요한 화이트스페이스 보이게 하기
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

;; duplicate-thing setting
(global-set-key (kbd "C-S-c") 'duplicate-thing)

;; volatile-highlights-mode
(volatile-highlights-mode t)

;; clean aindent
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; yasnippet setting
(yas-global-mode 1)

;; global-auto-revert-mode
(global-auto-revert-mode)

;; hippie-expand는 dabbrev-expand의 더 나은 버전입니다.
;; dabbrev-expand는 현재 버퍼들 그리고 다른 버퍼들에, 이미 입력한 단어들에 대해 검색하는데
;; hippie-expand는 파일이름, kill ring과 같은 더 많은 소스를 포함합니다.
(global-set-key (kbd "M-/") 'hippie-expand) ;;dabbrev-expand를 바꿈.
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; 현재 버퍼를 검색하는데, “동적으로” 단어 확장.
   Try-expand-dabbrev-all-buffers ;; 모든 다른 버퍼를 검색하는데 “동적으로” 단어를 확장.
   try-expand-dabbrev-from-kill ;; kill ring을 검색하는데, “동적으로” 단어를 확장.
   try-complete-file-name-partially ;; 고유한 문자 수 만큼, 파일이름으로 텍스트를 완성.
   try-complete-file-name ;; 파일이름으로 텍스트를 완성.
   try-expand-all-abbrevs ;; 모든 abbrev 테이블에 따라 point 전에 단어를 확장함.
   try-expand-list ;; 현재 리스트를 버퍼에 전체 행으로 완성함.
   try-expand-line ;; 현재 행을 버퍼에 전체 행으로 완성함.
   try-complete-lisp-symbol-partially ;; 고유한 문자 수 만큼, Emacs Lisp symbol로써 완성.
   try-complete-lisp-symbol) ;; Emacs Lisp symbol로써 단어를 완성함.
 )

(setq ibuffer-use-other-window t)

;; go-to-address-mode
(add-hook 'prog-mode-hook 'goto-address-mode)
(add-hook 'text-mode-hook 'goto-address-mode)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (scroll-bar-mode -1))

(blink-cursor-mode -1)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; highlight-number
(add-hook 'prog-mode-hook (lambda () (highlight-numbers-mode)))

;; highligh-symbol
(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

;; discover-my-major
(global-unset-key (kbd "C-h h")) ; hello world 단축키 취소
(define-key 'help-command (kbd "h m") 'discover-my-major)

;; rainbow-mode
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; expand-region
(global-set-key (kbd "C-&") 'er/expand-region)
(global-set-key (kbd "C-M-&") 'er/contract-region)

;; multi-term
(global-set-key (kbd "C-c C-m o") 'multi-term)
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m >") 'multi-term-next)))
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m <") 'multi-term-prev)))
