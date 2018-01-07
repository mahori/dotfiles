(use-package dired+
  :ensure t
  :config
  (setq dired-dwim-target t)
  (setq wdired-allow-to-change-permissions t)
  (let ((gls "/usr/local/bin/gls"))
    (when (file-exists-p gls)
      (setq insert-directory-program gls)))
  )
