(when (>= (user-uid) 1000)
  (defun mahori:cocoa-emacs-mode-hook ()
    (auto-revert-mode 1)
    (company-mode 1)
    (hl-line-mode 1)
    (show-paren-mode 1)
    (mahori:default-mode-hook)
    )

  (defun mahori:ruby-mode-hook ()
    (setq ruby-deep-indent-paren-style nil)
    (mahori:cocoa-emacs-mode-hook)
    )

  (use-package php-mode
    :ensure t
    )

  (mapc (lambda (pair)
          (when (eq (cdr pair) 'perl-mode)
            (setcdr pair 'cperl-mode)))
        (append auto-mode-alist interpreter-mode-alist))

  (add-hook 'cperl-mode-hook 'mahori:cocoa-emacs-mode-hook)
  (add-hook 'emacs-lisp-mode-hook 'mahori:cocoa-emacs-mode-hook)
  (add-hook 'php-mode-hook 'mahori:cocoa-emacs-mode-hook)
  (add-hook 'python-mode-hook 'mahori:cocoa-emacs-mode-hook)
  (add-hook 'ruby-mode-hook 'mahori:ruby-mode-hook)
  (add-hook 'sh-mode-hook 'mahori:cocoa-emacs-mode-hook)
  )