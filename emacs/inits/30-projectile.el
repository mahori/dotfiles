(use-package projectile
  :ensure t
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  (setq projectile-tags-command "gtags")
  (setq projectile-tags-file-name "GTAGS")
  (projectile-mode 1)
  )

(use-package counsel-projectile
  :ensure t
  :bind ("C-c [" . counsel-projectile)
  )
