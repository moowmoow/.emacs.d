
;; multi-term
(global-set-key (kbd "C-c C-m t") 'multi-term)
(global-set-key (kbd "C-c C-m o") 'multi-term-dedicated-open)
(global-set-key (kbd "C-c C-m q") 'multi-term-dedicated-close)
(global-set-key (kbd "C-c C-m s") 'multi-term-dedicated-select)
(global-set-key (kbd "C-x M-RET") 'multi-term-dedicated-toggle)
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m >") 'multi-term-next)))
(add-hook 'term-mode-hook (lambda () (global-set-key (kbd "C-c C-m <") 'multi-term-prev)))

