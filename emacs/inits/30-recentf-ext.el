(use-package recentf-ext
  :ensure t
  :config
  (setq recentf-max-saved-items (expt recentf-max-saved-items 2))
  (recentf-mode 1)
  )
