(use-package diminish
  :ensure t
  )

(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1)
  )

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
  :bind (("C-x C-f" . helm-for-files)   ; find-file
         ("M-s o" . helm-occur)         ; occur
         ("M-x" . helm-M-x)             ; execute-extended-command
         ("M-y" . helm-show-kill-ring)) ; yank-pop
  :chords ("ho". helm-occur)
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
