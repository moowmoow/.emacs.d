(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.\\([pP][L]m]\\||psgi\\|t\\)\\'" . cperl-mode))

(eval-after-load "cperl-mode"
  '(progn
     (helm-perldoc:setup)))

(add-hook 'cperl-mode-hook 'helm-perldoc:carton-setup)

(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))

;; for plenv user
(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-with-folder-structure))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (guess-plenv-perl-path) (list "-wc" local-file))))

;; for perlbrew user
(defun flymake-perl-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (perlbrew-mini-get-current-perl-path)
          (list "-MProject::Libs" "-wc" local-file))))
