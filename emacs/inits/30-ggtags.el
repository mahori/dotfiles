(defun mahori:ggtags-hook ()
  (ggtags-mode 1)
  (setq-local hippie-expand-try-functions-list
              (cons 'ggtags-try-complete-tag hippie-expand-try-functions-list)))

(use-package ggtags
  :straight t
  :commands (ggtags-mode mahori:ggtags-hook)
  :hook ((c-mode-common cperl-mode) . mahori:ggtags-hook)
  )
