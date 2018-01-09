(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default bidi-display-reordering nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq cua-enable-cua-keys nil)
(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq history-delete-duplicates t)
(setq history-length (* 10 history-length))
(setq message-log-max (* 10 message-log-max))
(setq set-mark-command-repeat-pop t)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq view-read-only t)

(cua-mode 1)
(global-hl-line-mode 1)
(global-linum-mode 1)
(save-place-mode 1)
(savehist-mode 1)
(show-paren-mode 1)

(add-to-list 'backup-directory-alist (cons "." mahori:backup-directory))
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(setq auto-save-file-name-transforms `((".*" ,mahori:backup-directory t)))
(setq backup-enable-predicate 'mahori:dont-backup-commit-files-p)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        ;; try-expand-all-abbrevs
        ;; try-expand-list
        ;; try-expand-line
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        ;; try-complete-lisp-symbol-partially
        ;; try-complete-lisp-symbol
        )

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (expand-file-name "bin" (getenv "HOME")))
