(use-package flycheck
  :straight t
  :commands flycheck-mode
  :hook (cperl-mode . flycheck-mode)
  )

(use-package flycheck-pos-tip
  :straight t
  :after flycheck
  :commands flycheck-pos-tip-mode
  :hook (flycheck-mode . flycheck-pos-tip-mode)
  )
