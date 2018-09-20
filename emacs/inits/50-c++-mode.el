(defun mahori:c++-mode-indent-hook ()
  (c-set-offset 'innamespace 0)
  )

(add-hook 'c++-mode-hook 'mahori:c++-mode-indent-hook)
