(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ivy-yasnippet yasnippet-snippets company-php company-web emmet-mode helm-perldoc elpy ob-restclient company-restclient restclient magit-svn rainbow-blocks rainbow-delimiters rainbow-identifiers zenburn-theme spacemacs-theme moe-theme powerline diff-hl vlf ztree recentf-ext ibuffer-vc smartparens dap-mode lsp-ui company-lsp use-package lsp-java expand-region rainbow-mode discover-my-major highlight-symbol highlight-numbers paganini-theme flx-ido clean-aindent-mode duplicate-thing plantuml-mode ejc-sql session ido-vertical-mode edbi monokai-theme org-wiki jade-mode gradle-mode eyebrowse groovy-mode helm-descbinds meghanada xref-js2 wgrep undo-tree tern tern-auto-complete tern-context-coloring org-bullets stylus-mode js2-refactor js2-mode markdown-mode web-mode prodigy nodejs-repl neotree which-key iedit multi-term counsel-projectile company magit projectile counsel avy swiper))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 패키지 초기화
(package-initialize)

;; 저장소 추가
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; 로딩 경로 추가
(add-to-list 'load-path "~/.emacs.d/lib/func")

;; 함수 추가
(require 'custom-functions)

;; 설정 파일 로딩
(mapc 'load (directory-files-recursively "~/.emacs.d/conf" ".\.el"))

;; 사이트 설정 파일 로딩
(mapc 'load (directory-files-recursively "~/.emacs.d/site" ".\.el"))
