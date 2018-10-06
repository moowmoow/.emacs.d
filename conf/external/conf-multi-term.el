
;; multi-term
(global-set-key (kbd "C-c C-m o") 'multi-term)
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m >") 'multi-term-next)))
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m <") 'multi-term-prev)))
