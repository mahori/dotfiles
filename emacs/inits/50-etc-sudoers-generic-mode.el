(defun mahori:etc-sudoers-generic-mode-hook ()
  (auto-revert-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  )

(add-hook 'etc-sudoers-generic-mode-hook 'mahori:etc-sudoers-generic-mode-hook)
