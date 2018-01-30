(use-package company
  :ensure t
  :diminish
  :config
  (global-company-mode)
  )

(use-package company-plsense
  :ensure t
  :config
  (add-to-list 'company-backends 'company-plsense)
  )
