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

(use-package helm-config
  :ensure helm
  :config
  (setq helm-M-x-fuzzy-match t)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (helm-migemo-mode 1)
  )

(use-package mykie
  :ensure t
  :config
  (mykie:initialize)
  )

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  )
