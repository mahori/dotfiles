(use-package avy
  :ensure t
  :bind (("M-g M-l" . avy-goto-line)
         ("M-g M-w" . avy-goto-word-1))
  :config
  (custom-set-faces
   '(avy-lead-face ((t (:height 1.5))))
   '(avy-lead-face-0 ((t (:height 1.5)))))
  (avy-setup-default)
  )

(use-package avy-migemo
  :ensure t
  :bind ("M-g M-c" . avy-migemo-goto-char-timer)
  :config
  (avy-migemo-mode 1)
  )
