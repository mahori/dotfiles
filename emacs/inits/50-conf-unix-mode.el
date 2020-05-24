(defun mahori:conf-unix-mode-hook ()
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'conf-unix-mode-hook 'mahori:conf-unix-mode-hook)
