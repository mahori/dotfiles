(use-package avy
  :ensure t
  :bind (("M-g M-l" . avy-goto-line)
         ("M-g M-w" . avy-goto-word-1))
  :config
  (avy-setup-default)
  )

(use-package avy-migemo
  :ensure t
  :bind ("M-g M-c" . avy-migemo-goto-char-timer)
  :config
  (avy-migemo-mode 1)
  )
