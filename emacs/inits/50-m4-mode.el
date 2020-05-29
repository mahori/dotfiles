(defun mahori:m4-mode-hook ()
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'm4-mode-hook 'mahori:m4-mode-hook)
