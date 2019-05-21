(defun mahori:hosts-generic-mode-hook ()
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'hosts-generic-mode-hook 'mahori:hosts-generic-mode-hook)
