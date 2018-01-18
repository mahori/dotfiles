(bind-keys ("C-;"  . avy-migemo-goto-char-timer)
           ("C-'"  . avy-goto-line)
           ("C-:"  . sort-lines)
           ("C-\"" . toggle-truncate-lines))

(bind-keys :map elscreen-map
           ("C-z" . iconify-or-deiconify-frame))
