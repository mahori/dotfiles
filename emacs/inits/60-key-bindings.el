(mykie:set-keys nil
  ;; "C-s"                                 ; isearch-forward
  ;; :default isearch-forward
  ;; :C-u! helm-swoop

  "C-x C-b"                             ; list-buffers
  :default bs-show

  "C-x C-f"                             ; find-file
  :default helm-for-files

  "M-SPC"                               ; just-one-space
  :default mahori:bm-toggle-or-helm
  :C-u! just-one-space

  "M-g M-c"
  :default avy-migemo-goto-char-timer

  "M-g M-l"
  :default avy-goto-line

  "M-g M-w"
  :default avy-goto-word-1

  ;; "M-s o"                               ; occur
  ;; :default helm-occur

  "M-x"                                 ; execute-extended-command
  :default helm-M-x

  "M-y"                                 ; yank-pop
  :default helm-show-kill-ring

  "M-%"                                 ; query-replace
  :default vr/query-replace

  "M-["
  :default bm-previous

  "M-]"
  :default bm-next

  [remap comment-dwim]
  :default comment-dwim-2

  [remap describe-mode]
  :default helm-describe-modes

  [remap other-window]
  :default ace-window
  )

(mykie:set-keys dired-mode-map
  "e"
  :default wdired-change-to-wdired-mode
  )

(mykie:set-keys helm-swoop-map
  "C-r"
  :default helm-previous-line

  "C-s"
  :default helm-next-line
  )

(key-chord-define-global "ho" 'helm-occur)
(key-chord-define-global "hs" 'helm-swoop)
