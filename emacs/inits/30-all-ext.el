(use-package all-ext
  :ensure t
  :bind (:map all-mode-map
              ("C-c C-m" . mc/edit-lines-in-all))
  )
