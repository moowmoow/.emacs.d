
;; 바 삭제
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (scroll-bar-mode -1))

;; 커서 깜박임 삭제
(blink-cursor-mode -1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
