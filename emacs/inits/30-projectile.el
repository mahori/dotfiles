(use-package projectile
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-tags-command "gtags")
  (setq projectile-tags-file-name "GTAGS")
  (projectile-mode 1)
  )

(use-package helm-projectile
  :ensure t
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  )
