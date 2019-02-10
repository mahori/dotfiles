(use-package irony
  :ensure t
  :hook (((c-mode c++-mode objc-mode) . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options))
  )

(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony)
  )
