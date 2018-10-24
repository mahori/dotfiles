(use-package irony
  :straight t
  :hook (((c-mode c++-mode objc-mode) . irony-mode)
         (irony-mode . irony-cdb-autosetup-compile-options))
  )

(use-package company-irony
  :straight t
  :config
  (add-to-list 'company-backends 'company-irony)
  )
