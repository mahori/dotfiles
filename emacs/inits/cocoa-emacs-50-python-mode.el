(defun mahori:python-mode-hook ()
  (auto-revert-mode 1)
  (company-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  (show-paren-mode 1)
  (yas-minor-mode 1)
  )

(add-hook 'python-mode-hook 'mahori:python-mode-hook)