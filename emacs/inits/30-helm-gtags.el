(use-package helm-gtags
  :ensure t
  :diminish
  :bind (:map helm-gtags-mode-map
              ("M-t" . helm-gtags-find-tag)
              ("M-r" . helm-gtags-find-rtag)
              ("M-s" . helm-gtags-find-symbol)
              ("M-g M-p" . helm-gtags-parse-file)
              ("C-c <" . helm-gtags-previous-history)
              ("C-c >" . helm-gtags-next-history)
              ("M-," . helm-gtags-pop-stack))
  :config
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (custom-set-variables
   '(helm-gtags-auto-update t)
   '(helm-gtags-ignore-case t)
   '(helm-gtags-path-style 'relative)
   '(helm-gtags-prefix-key "\C-t")
   '(helm-gtags-suggested-key-mapping t)
   )
  )
