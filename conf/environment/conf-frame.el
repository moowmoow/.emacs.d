;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP   : Environment > Frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 200))
(set-frame-position (selected-frame) 80 20)

;; 프레임 타이틀을 경로로 표시
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                 "%b"))))
