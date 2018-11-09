(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-E") 'eval-region-or-buffer)))
