(mapc (lambda (pair)
        (when (eq (cdr pair) 'perl-mode)
          (setcdr pair 'cperl-mode)))
      (append auto-mode-alist interpreter-mode-alist))
