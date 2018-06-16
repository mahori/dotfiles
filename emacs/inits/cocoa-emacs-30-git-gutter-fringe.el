(use-package git-gutter-fringe
  :if window-system
  :ensure t
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode)
  (git-gutter:linum-setup)
  (setq git-gutter-fr:side 'right-fringe)
  )
