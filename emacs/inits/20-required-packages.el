(use-package migemo
  :ensure t
  :config
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-regex-dictionary nil)
  (setq migemo-user-dictionary nil)
  (migemo-init)
  )
