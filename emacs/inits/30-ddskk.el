(use-package skk
  :ensure ddskk
  :init
  (setq skk-user-directory (expand-file-name "skk" user-emacs-directory))
  :config
  (setq default-input-method "japanese-skk")
  )
