(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package init-loader
  :ensure t
  :config
  (init-loader-load)
  )

;; (require 'org)
;; (org-babel-load-file (expand-file-name "myinit.org" user-emacs-directory))
