(defun mahori:dns-tab-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  )

(add-hook 'dns-mode-hook 'mahori:dns-tab-hook)
