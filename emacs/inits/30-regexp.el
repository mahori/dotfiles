(use-package pcre2el
  :straight t
  )

(use-package visual-regexp
  :straight t
  :bind ("M-%" . vr/query-replace)      ; query-replace
  )

(use-package visual-regexp-steroids
  :straight t
  :config
  (setq vr/engine 'pcre2el)
  )
