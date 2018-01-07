(use-package projectile
  :ensure t
  :config
  (setq projectile-tags-command "/usr/local/opt/ctags/bin/ctags -Re -f \"%s\" %s")
  (projectile-mode 1)
  )

(use-package helm-projectile
  :ensure t
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  )
