(global-set-key (kbd "C-c D") 'delete-file-and-buffer)
(global-set-key (kbd "C-M-<up>") 'move-line-up)
(global-set-key (kbd "C-M-<down>") 'move-line-down)
(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)
(global-set-key (kbd "C-c r") 'rename-file-and-buffer)
(global-set-key (kbd "M-g M-c") 'go-to-column)

;; 프레임 흐려지게 - docker를 쓰고 있어서 프레임 안됨..
;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 100 100))
;;(eval-when-compile (require 'cl))
;;
;;(global-set-key (kbd "C-c C-a") 'toggle-transparency)
