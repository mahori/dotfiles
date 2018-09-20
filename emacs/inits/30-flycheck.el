(use-package flycheck
  :ensure t
  :commands flycheck-mode
  :hook (cperl-mode . flycheck-mode)
  )

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :commands flycheck-pos-tip-mode
  :hook (flycheck-mode . flycheck-pos-tip-mode)
  )
