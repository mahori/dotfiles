(use-package projectile
  :straight t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  (setq projectile-tags-command "gtags")
  (setq projectile-tags-file-name "GTAGS")
  (projectile-mode 1)
  )

(use-package counsel-projectile
  :straight t
  :bind ("C-c [" . counsel-projectile)
  )
