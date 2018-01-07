(defun mahori:bm-find-files-in-repository ()
  (interactive)
  (cl-loop for (key . _) in bm-repository
           when (file-exists-p key)
           do (find-file-noselect key)))

(defun mahori:bm-repository-load-and-open ()
  (interactive)
  (bm-repository-load)
  (mahori:bm-find-files-in-repository))

(defun mahori:bm-buffer-restore-safe ()
  (ignore-errors (bm-buffer-restore)))

(defun mahori:bm-save-to-repository ()
  (interactive)
  (unless noninteractive
    (bm-buffer-save-all)
    (bm-repository-save)))

(defun mahori:bm-toggle-or-helm ()
  (interactive)
  (bm-toggle)
  (when (eq last-command 'mahori:bm-toggle-or-helm)
    (helm-bm)))

(use-package bm
  :ensure t
  :config
  (setq-default bm-buffer-persistence t)
  (setq bm-repository-file (expand-file-name ".bm-repository" user-emacs-directory))
  (setq bm-restore-repository-on-load t)
  (add-hook 'after-init-hook 'mahori:bm-repository-load-and-open)
  (add-hook 'after-revert-hook 'bm-buffer-restore)
  (add-hook 'before-save-hook 'bm-buffer-save)
  (add-hook 'find-file-hooks 'mahori:bm-buffer-restore-safe)
  (add-hook 'kill-buffer-hook 'bm-buffer-save)
  (add-hook 'kill-emacs-hook 'mahori:bm-save-to-repository)
  (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
  (run-with-idle-timer 600 t 'mahori:bm-save-to-repository)
  )

(use-package helm-bm
  :ensure t
  :config
  (setq helm-source-bm (delete '(multiline) helm-source-bm))
  (push '(migemo) helm-source-bm)
  )
