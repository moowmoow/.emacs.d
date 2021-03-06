(provide 'custom-functions)

;; custom function
;; Delete File and Buffer
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "deleted file %s" filename)
          (kill-buffer))))))

;; Move Current Line Up or Down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; Rename File and Buffer
(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;; Switch to Previous Buffer
(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Go to Column
(defun go-to-column (column)
  (interactive "ncolumn: ")
  (move-to-column column t))

;; 반투명
(defun opaque-frame ()
  (set-frame-parameter nil 'alpha '(100 100))
  (set-foreground-color "ghost white")
  (set-background-color "black")
)

(defun transparent-frame()
  (set-frame-parameter nil 'alpha '(70 60))
  (set-foreground-color "black")
  (set-background-color "ghost white")
)

(defun toggle-transparency ()
   (interactive)
   (if (/=
        (cadr (find 'alpha (frame-parameters nil) :key #'car))
        100)
       (opaque-frame)
       ;(set-frame-parameter nil 'alpha '(100 100))
     ;(set-frame-parameter nil 'alpha '(85 60))
     (transparent-frame)
      ;(set-foreground-color . "black")
      ;(set-foreground-color . "white"))
     ))

(defun transparent(alpha-level no-focus-alpha-level)
"Let's you make the window transparent"
(interactive "nAlpha level (0-100): \nnNo focus alpha level (0-100): ")
(set-frame-parameter (selected-frame) 'alpha (list alpha-level no-focus-alpha-level))
(add-to-list 'default-frame-alist `(alpha ,alpha-level)))

;; 모든 버퍼 삭제
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; 현재 버퍼를 제외한 모든 버퍼 삭제
(defun only-one-buffer ()
  (interactive)
  (let ((current-buffer (current-buffer)))
    (dolist (buffer (buffer-list))
      (unless (eql current-buffer buffer)
        (kill-buffer buffer)))))

;; (defun remove-html-attribute ()
;;   "HTML Attribute Remove"
;;   (replace-regexp ""\(.*?\)"" ""))

(defun eval-region-or-buffer ()
  (interactive)
  (let ((debug-on-error t))
    (cond
     (mark-active
      (call-interactively 'eval-region)
      (message "Region evaluated!")
      (setq deactivate-mark t))
     (t
      (eval-buffer)
      (message "Buffer evaluated!")))))

;; Completing point by some yasnippet key
(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
    (let ((original-point (point)))
      (while (and
              (not (= (point) (point-min) ))
              (not
               (string-match "[[:space:]\n]" (char-to-string (char-before)))))
        (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
        (yas-expand)))))
