(use-package pcre2el
  :ensure t
  )

(use-package visual-regexp
  :ensure t
  :bind ("M-%" . vr/query-replace)      ; query-replace
  )

(use-package visual-regexp-steroids
  :ensure t
  :config
  (setq vr/engine 'pcre2el)
  )
