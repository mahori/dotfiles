(defun mahori:default-generic-mode-hook ()
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'default-generic-mode-hook 'mahori:default-generic-mode-hook)
