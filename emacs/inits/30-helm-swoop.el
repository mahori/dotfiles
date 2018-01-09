(use-package helm-swoop
  :ensure t
  :bind (:map helm-swoop-map
              ("C-r" . helm-previous-line)
              ("C-s" . helm-next-line))
  :chords ("hs" . helm-swoop)
  )
