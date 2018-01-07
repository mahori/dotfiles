(use-package recentf-ext
  :ensure t
  :config
  (setq recentf-max-saved-items (* 10 recentf-max-saved-items))
  (recentf-mode 1)
  )
