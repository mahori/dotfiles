(use-package ggtags
  :ensure t
  :diminish
  :config
  (add-hook 'c++-mode-hook 'ggtags-mode)
  )
