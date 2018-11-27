;; (use-package autodisass-java-bytecode
;;   :ensure t
;;   :defer t)

;; (use-package google-c-style
;;   :defer t
;;   :ensure t
;;   :commands
;;   (google-set-c-style))

;; (use-package meghanada
;;   :defer t
;;   :init
;;   (add-hook 'java-mode-hook
;;             (lambda ()
;;               ;; (google-set-c-style)
;;               ;; (google-make-newline-indent)
;;               (meghanada-mode t)
;;               (smartparens-mode t)
;;               (rainbow-delimiters-mode t)
;;               (highlight-symbol-mode t)
;;               (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

;;   :config
;;   (use-package realgud
;;     :ensure t)
;;   (setq indent-tabs-mode nil)
;;   (setq tab-width 2)
;;   (setq c-basic-offset 2)
;;   (setq meghanada-server-remote-debug t)
;;   (setq meghanada-javac-xlint "-Xlint:all,-processing")
;;   :bind
;;   (:map meghanada-mode-map
;;         ("C-S-t" . meghanada-switch-testcase)
;;         ("M-RET" . meghanada-local-variable)
;;         ("C-M-." . helm-imenu)
;;         ("M-r" . meghanada-reference)
;;         ("M-t" . meghanada-typeinfo)
;;         ("C-z" . hydra-meghanada/body))
;;   :commands
;;   (meghanada-mode))

;; (defhydra hydra-meghanada (:hint nil :exit t)
;; "
;; ^Edit^                           ^Tast or Task^
;; ^^^^^^-------------------------------------------------------
;; _f_: meghanada-compile-file      _m_: meghanada-restart
;; _c_: meghanada-compile-project   _t_: meghanada-run-task
;; _o_: meghanada-optimize-import   _j_: meghanada-run-junit-test-case
;; _s_: meghanada-switch-test-case  _J_: meghanada-run-junit-class
;; _v_: meghanada-local-variable    _R_: meghanada-run-junit-recent
;; _i_: meghanada-import-all        _r_: meghanada-reference
;; _g_: magit-status                _T_: meghanada-typeinfo
;; _l_: helm-ls-git-ls
;; _q_: exit
;; "
;;   ("f" meghanada-compile-file)
;;   ("m" meghanada-restart)

;;   ("c" meghanada-compile-project)
;;   ("o" meghanada-optimize-import)
;;   ("s" meghanada-switch-test-case)
;;   ("v" meghanada-local-variable)
;;   ("i" meghanada-import-all)

;;   ("g" magit-status)
;;   ("l" helm-ls-git-ls)

;;   ("t" meghanada-run-task)
;;   ("T" meghanada-typeinfo)
;;   ("j" meghanada-run-junit-test-case)
;;   ("J" meghanada-run-junit-class)
;;   ("R" meghanada-run-junit-recent)
;;   ("r" meghanada-reference)

;;   ("q" exit)
;;   ("z" nil "leave"))

(require 'cc-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-c2ontents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile
  :ensure t)

(use-package treemacs
  :ensure t)

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode))

(use-package lsp-mode
  :ensure t
  :init (setq lsp-eldoc-render-all nil
              lsp-highlight-symbol-at-point nil))

(use-package hydra
  :ensure t)

(use-package company-lsp
  :after company
  :ensure t
  :config
  (setq company-lsp-cache-candidates t
        company-lsp-async t))

;; (use-package company-lsp
;;   :after  company
;;   :ensure t
;;   :config
;;   (add-hook 'java-mode-hook (lambda () (push 'company-lsp company-backends)))
;;   (setq company-lsp-cache-candidates t)
;;   (push 'java-mode company-global-modes))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-update-mode 'point))

(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook
            (lambda()
              (setq-local company-backends (list 'company-lsp))))
  (add-hook 'java-mode-hook 'lsp-java-enable)
  (add-hook 'java-mode-hook 'flycheck-mode)
  (add-hook 'java-mode-hook 'company-mode)
  (add-hook 'java-mode-hook 'lsp-ui-mode))

;; (use-package lsp-java
;;   :ensure t
;;   :requires (lsp-ui-flycheck lsp-ui-sideline)
;;   :config
;;   (add-hook 'java-mode-hook  'lsp-java-enable)
;;   (add-hook 'java-mode-hook  'flycheck-mode)
;;   (add-hook 'java-mode-hook  'company-mode)
;;   (add-hook 'java-mode-hook  (lambda () (lsp-ui-flycheck-enable t)))
;;   (add-hook 'java-mode-hook  'lsp-ui-mode))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :after 'lsp-java)

(use-package lsp-java-treemacs
  :after (treemacs))
