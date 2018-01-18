(use-package ggtags
  :ensure t
  :diminish
  :config
  (defun mahori:ggtags-hook ()
    (ggtags-mode 1)
    (setq-local hippie-expand-try-functions-list
                (cons 'ggtags-try-complete-tag hippie-expand-try-functions-list)))

  (add-hook 'c-mode-common-hook 'mahori:ggtags-hook)
  (add-hook 'cperl-mode-hook 'mahori:ggtags-hook)
  )
