(use-package smex
  :ensure t
  :bind (("M-x" . smex)                      ; execute-extended-command
         ("M-X" . smex-major-mode-commands))
  :config
  (smex-initialize)
  )
