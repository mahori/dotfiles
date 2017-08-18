(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(require 'package)
(package-initialize)

(require 'org)
(org-babel-load-file (expand-file-name "myinit.org" user-emacs-directory))
