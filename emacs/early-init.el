(when (and (eq system-type 'darwin)
           (>= (user-uid) 1000))
  (setq default-frame-alist '((width  . 200)
                              (height . 75)))

  (set-face-attribute 'default nil :family "Ricty Discord" :height 150)

  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  )
