(use-package ace-window
  :ensure t
  :bind ([remap other-window] . ace-window)
  :config
  (custom-set-faces
   '(aw-leading-char-face ((t (:height 3.0)))))
  )
