(use-package avy
  :ensure t
  :config
  (custom-set-faces
   '(avy-lead-face ((t (:height 1.5))))
   '(avy-lead-face-0 ((t (:height 1.5)))))
  (avy-setup-default)
  )

(use-package avy-migemo
  :ensure t
  :config
  (avy-migemo-mode 1)
  )
