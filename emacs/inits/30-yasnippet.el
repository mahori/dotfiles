(use-package yasnippet
  :straight t
  :commands yas-minor-mode
  :hook ((c-mode-common emacs-lisp-mode org-mode cperl-mode) . yas-minor-mode)
  )

(use-package yasnippet-snippets
  :straight t
  :after yasnippet
  )
