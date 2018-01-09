(use-package open-junk-file
  :ensure t
  :config
  (setq open-junk-file-format (expand-file-name "junk/%Y/%m/%Y-%m-%d-%H:%M:%S." user-emacs-directory))
  )
