(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-parameters "repl :headless :host localhost")
 '(package-selected-packages
   (quote
    (plantuml-mode ejc-sql session ido-vertical-mode edbi monokai-theme org-wiki jade-mode gradle-mode eyebrowse groovy-mode helm-descbinds meghanada xref-js2 wgrep undo-tree tern tern-auto-complete tern-context-coloring org-bullets stylus-mode js2-refactor js2-mode markdown-mode web-mode prodigy nodejs-repl neotree which-key iedit multi-term counsel-projectile company magit projectile counsel avy swiper))))
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

;; basic setting
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(global-hl-line-mode t)
(global-linum-mode t)
(column-number-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(electric-pair-mode t)
(setq large-file-warning-threshold 100000000)
(defalias 'list-buffers 'ibuffer)

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

(setq session-jump-undo-threshold 80)
(global-set-key (kbd "C-c q") 'session-jump-to-last-change)

;; backup file setting
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

;; theme setting
(load-theme 'monokai t)

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

;(global-set-key (kbd "C-M up") 'move-line-up)
;(global-set-key (kbd "C-M down") 'move-line-down)

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
(counsel-projectile-mode t)

;; swiper mode setting
(global-set-key (kbd "C-s") 'swiper)

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
