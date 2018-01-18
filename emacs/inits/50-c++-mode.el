(defun mahori:c++-indent-hook ()
  (c-set-offset 'innamespace 0)
  )

(add-hook 'c++-mode-hook 'mahori:c++-indent-hook)
