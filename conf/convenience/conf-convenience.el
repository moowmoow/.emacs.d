;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > Revert
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 변경된 파일 내용 자동 반영
(global-auto-revert-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > Hippe Expand
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hippie-expand는 dabbrev-expand의 더 나은 버전입니다.
;; dabbrev-expand는 현재 버퍼들 그리고 다른 버퍼들에, 이미 입력한 단어들에 대해 검색하는데
;; hippie-expand는 파일이름, kill ring과 같은 더 많은 소스를 포함합니다.
(global-set-key (kbd "M-/") 'hippie-expand) ;;dabbrev-expand를 바꿈.

(setq hippie-expand-try-functions-list
      '(
        try-expand-dabbrev                 ; 현재 버퍼를 검색하는데, “동적으로” 단어 확장.
        try-expand-dabbrev-all-buffers     ; 모든 다른 버퍼를 검색하는데 “동적으로” 단어를 확장.
        try-expand-dabbrev-from-kill       ; kill ring을 검색하는데, “동적으로” 단어를 확장.
        try-complete-file-name-partially   ; 고유한 문자 수 만큼, 파일이름으로 텍스트를 완성.
        try-complete-file-name             ; 파일이름으로 텍스트를 완성.
        try-expand-all-abbrevs             ; 모든 abbrev 테이블에 따라 point 전에 단어를 확장함.
        try-expand-list                    ; 현재 리스트를 버퍼에 전체 행으로 완성함.
        try-expand-line                    ; 현재 행을 버퍼에 전체 행으로 완성함.
        try-complete-lisp-symbol-partially ; 고유한 문자 수 만큼, Emacs Lisp symbol로써 완성.
        try-complete-lisp-symbol           ; Emacs Lisp symbol로써 단어를 완성함.
        )
      )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > HL Line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-hl-line-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > IBuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defalias 'list-buffers 'ibuffer)

;; 항상 다른 윈도우에 ibuffer 표시
(setq ibuffer-use-other-window t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > Whitespace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 불필요한 whitespace가 생성되면 whitespace 하이라이트
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace t)))

;; whitepsace 모드 토클
(global-set-key (kbd "C-c w") 'whitespace-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Convenience > Windmove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 더 쉽게 윈도우 탐색
(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE : session
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq session-jump-undo-threshold 80)

(global-set-key (kbd "C-c q") 'session-jump-to-last-change)
