(use-package git-gutter
  :ensure t
  :diminish
  :config
  (global-git-gutter-mode 1)
  (git-gutter:linum-setup)
  )
