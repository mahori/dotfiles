(use-package pcre2el
  :ensure t
  )

(use-package visual-regexp
  :ensure t
  )

(use-package visual-regexp-steroids
  :ensure t
  :config
  (setq vr/engine 'pcre2el)
  )
