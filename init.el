(package-initialize)

;; package setting
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 200))
(set-frame-position (selected-frame) 80 20)


;; backup file setting
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(org-wiki jade-mode gradle-mode eyebrowse groovy-mode helm-descbinds meghanada xref-js2 wgrep undo-tree tern tern-auto-complete tern-context-coloring org-bullets stylus-mode js2-refactor js2-mode markdown-mode web-mode prodigy nodejs-repl neotree which-key iedit multi-term counsel-projectile company magit projectile counsel zenburn-theme avy swiper))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

;; basic setting
(setq-default tab-width 4)
(global-hl-line-mode 1)
(global-linum-mode 1)
(delete-selection-mode t)
;;(desktop-save-mode t)

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
(setq org-wiki-location-list '("/mnt/documents/orgwiki/it"))
(setq org-wiki-location (car org-wiki-location-list))

(defalias 'w-h #'org-wiki-helm)
(defalias 'w-s #'org-wiki-switch)
(defalias 'w-sr #'org-wiki-switch-root)
(defalias 'w-hf #'org-wiki-helm-frame)
(defalias 'w-hr #'org-wiki-helm-read-only)
(defalias 'w-i #'org-wiki-index)
(defalias 'w-in #'org-wiki-insert)
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
			(setq c-basic-offset 2)
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
(add-to-list 'auto-mode-alist '("\\.js\\" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (auto-complete-mode)))
(eval-after-load 'tern
  '(progn
	(require 'tern-auto-complete)
	(setq tern-ac-on-dot t)
	(tern-ac-setup)))
