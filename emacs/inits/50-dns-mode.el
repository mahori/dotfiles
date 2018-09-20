(defun mahori:dns-mode-indent-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  )

(add-hook 'dns-mode-hook 'mahori:dns-mode-indent-hook)
