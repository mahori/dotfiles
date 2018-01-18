(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  )

(use-package wgrep-ag
  :ensure t
  :config
  (defun mahori:ag-mode-hook ()
    (setq wgrep-auto-save-buffer t)
    (setq wgrep-enable-key "r")
    (wgrep-ag-setup)
    )

  (add-hook 'ag-mode-hook 'mahori:ag-mode-hook)
  )
