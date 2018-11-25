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
