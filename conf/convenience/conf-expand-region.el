;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : expand-region
;;
;; GROUP   : Convenience > Abbreviation > Expand
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 영역을 확장
(global-set-key (kbd "C-&") 'er/expand-region)

;; 영역을 축소
(global-set-key (kbd "C-M-&") 'er/contract-region)
