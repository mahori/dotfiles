(use-package smex
  :ensure t
  :bind (("C-c x" . smex)
         ("C-c X" . smex-major-mode-commands))
  :config
  (smex-initialize)
  )
