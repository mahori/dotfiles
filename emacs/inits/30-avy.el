(use-package avy
  :straight t
  :bind (("M-g M-l" . avy-goto-line)
         ("M-g M-w" . avy-goto-word-1))
  :custom-face
  (avy-lead-face ((t (:height 1.25))))
  (avy-lead-face-0 ((t (:height 1.25))))
  :config
  (avy-setup-default)
  )

(use-package avy-migemo
  :straight t
  :bind ("M-g M-c" . avy-migemo-goto-char-timer)
  :config
  (avy-migemo-mode 1)
  )
