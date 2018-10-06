;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : projectile
;;
;; GROUP   : Convenience > Projectile
;; SITE    : https://github.com/bbatsov/projectile
;;           http://projectile.readthedocs.io
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; projectile mode setting
(projectile-mode +1)
;;(projectile-global-mode)

;; 키 바인딩
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; 프로젝트 타일 completion 세팅
(setq projectile-completion-system 'ivy)

;;
(counsel-projectile-mode t)
