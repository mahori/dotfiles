(when (and (eq system-type 'darwin)
           (>= (user-uid) 1000))
  (setq default-frame-alist '((width  . 128)
                              (height . 64)))

  (set-face-attribute 'default nil :family "HackGen" :height 150)

  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  )
