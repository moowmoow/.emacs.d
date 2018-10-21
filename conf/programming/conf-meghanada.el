;; meghanada mode setting

;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;;             (meghanada-mode t)
;;             (flycheck-mode +1)
;;             (setq tab-width 4)
;;             (setq c-basic-offset 4)
;;             ;; use code format
;; ;;            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))
;;           ))

;; (cond ((eq system-type 'windows-nt)
;;        (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;        (setq meghanada-maven-path "mvn.cmd"))
;;       (t
;;        (setq meghanada-java-path "java")
;;        (setq meghanada-maven-path "mvn")))

;; (global-set-key (kbd "C-c C-t r") 'meghanada-reference)
;; (global-set-key (kbd "C-c C-t i") 'meghanada-typeinfo)
;; (global-set-key (kbd "C-c C-c m") 'meghanada-exec-main)
;; (global-set-key (kbd "C-c C-v s") 'meghanada-jump-symbol)
