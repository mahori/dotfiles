(bind-keys ("C-@" . hippie-expand)
           ("C-x C-b" . bs-show)                         ; list-buffers
           ("C-x C-f" . helm-for-files )                 ; find-file
           ("M-g M-c" . avy-migemo-goto-char-timer)
           ("M-g M-l" . avy-goto-line)
           ("M-g M-w" . avy-goto-word-1)
           ("M-s o" . helm-occur)                        ; occur
           ("M-x" . helm-M-x)                            ; execute-extended-command
           ("M-y" . helm-show-kill-ring)                 ; yank-pop
           ("M-%" . vr/query-replace)                    ; query-replace
           ("M-[" . bm-previous)
           ("M-]" . bm-next)
           ("<f5>" . point-undo)
           ("S-<f5>" . point-redo)
           ([remap comment-dwim] . comment-dwim-2)
           ([remap describe-mode] . helm-describe-modes)
           ([remap other-window] . ace-window))

(bind-keys :map dired-mode-map
           ("e" . wdired-change-to-wdired-mode))

(bind-keys :map view-mode-map
           ("N" . View-search-last-regexp-backward)
           ("?" . View-search-regexp-backward)
           ("G" . View-goto-line-last)
           ("b" . View-scroll-page-backward)
           ("f" . View-scroll-page-forward)
           ("h" . backward-char)
           ("j" . next-line)
           ("k" . previous-line)
           ("l" . forward-char)
           ("J" . View-scroll-line-forward)
           ("K" . View-scroll-line-backward)
           ("m" . bm-toggle)
           ("[" . bm-previous)
           ("]" . bm-next))

(mykie:set-keys nil
  ;; "C-s"                                 ; isearch-forward
  ;; :default isearch-forward
  ;; :C-u! helm-swoop
 )
