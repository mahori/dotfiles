(use-package howm
  :ensure t
  :config
  (defun mahori:howm-save-buffer-and-kill ()
    (interactive)
    (when (and (buffer-file-name)
               (howm-buffer-p))
      (save-buffer)
      (kill-buffer nil)))

  (setq howm-directory (expand-file-name "howm" user-emacs-directory))
  (setq howm-file-name-format "%Y/%m/%Y-%m-%d.txt")

  (bind-keys :map howm-mode-map
             ("C-c C-c" . mahori:howm-save-buffer-and-kill))
  )
