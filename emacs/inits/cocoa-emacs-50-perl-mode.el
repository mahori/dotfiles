(mapc (lambda (pair)
        (when (eq (cdr pair) 'perl-mode)
          (setcdr pair 'cperl-mode)))
      (append auto-mode-alist interpreter-mode-alist))

(defun mahori:perl-mode-hook ()
  (auto-revert-mode 1)
  (company-mode 1)
  (display-line-numbers-mode 1)
  (hl-line-mode 1)
  (show-paren-mode 1)
  (yas-minor-mode 1)
  )

(add-hook 'cperl-mode-hook 'mahori:perl-mode-hook)