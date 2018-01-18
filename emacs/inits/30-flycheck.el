(use-package flycheck
  :ensure t
  :hook (cperl-mode . flycheck-mode)
  :config
  (use-package flycheck-pos-tip
    :ensure t
    :config
    (flycheck-pos-tip-mode)
    )
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  )
