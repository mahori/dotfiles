(use-package dired
  :config
  (setq dired-dwim-target t)
  )

(use-package wdired
  :after dired
  :commands wdired-change-to-wdired-mode
  :bind (:map dired-mode-map
              ("e" . wdired-change-to-wdired-mode))
  :config
  (setq wdired-allow-to-change-permissions t)
  )
