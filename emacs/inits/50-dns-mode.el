(defun mahori:dns-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'dns-mode-hook 'mahori:dns-mode-hook)
