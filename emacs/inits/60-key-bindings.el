(bind-keys ("C-c a"   . align)
           ("C-x C-b" . bs-show))       ; list-buffers

(bind-keys :map dired-mode-map
           ("e" . wdired-change-to-wdired-mode))
