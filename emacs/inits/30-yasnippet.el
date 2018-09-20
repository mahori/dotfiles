(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook ((c-mode-common emacs-lisp-mode org-mode cperl-mode) . yas-minor-mode)
  )

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet
  )
