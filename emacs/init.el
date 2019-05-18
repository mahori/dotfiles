(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path (locate-user-emacs-file "el-get/recipes"))
(setq mahori:el-get-packages '(el-get
                               init-loader))
(when (and (eq system-type 'darwin)
           (> (user-uid) 1000))
  (setq mahori:el-get-packages (append mahori:el-get-packages '(avy-migemo))))
(el-get 'sync mahori:el-get-packages)

(setq-default indent-tabs-mode nil)

(setq history-delete-duplicates t)
(setq history-length (* history-length 10))
(setq inhibit-startup-screen t)

(save-place-mode 1)
(savehist-mode 1)

(use-package powerline
  :ensure t
  )

(use-package moe-theme
  :ensure t
  :after powerline
  :config
  (moe-dark)
  (powerline-moe-theme)
  )

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  )

(use-package counsel
  :ensure t
  :bind (("<f1> b"  . counsel-descbinds)         ; describe-bindings
         ("<f1> f"  . counsel-describe-function) ; describe-function
         ("<f1> v"  . counsel-describe-variable) ; describe-variable
         ("C-c r"   . counsel-recentf)
         ("C-x C-f" . counsel-find-file)         ; find-file
         ("M-x"     . counsel-M-x))              ; execute-extended-command
  )

(use-package smex
  :ensure t
  :hook (counsel-mode . smex-initialize)
  )

(use-package swiper
  :ensure t
  :bind ("C-c s" . swiper)
  )

(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2)        ; comment-dwim
  )

(use-package recentf-ext
  :ensure t
  :config
  (setq recentf-max-saved-items (* recentf-max-saved-items 10))
  (recentf-mode 1)
  )

(use-package visual-regexp
  :ensure t
  :bind ("M-%" . vr/query-replace)      ; query-replace
  )

(use-package pcre2el
  :ensure t
  :after visual-regexp
  )

(use-package visual-regexp-steroids
  :ensure t
  :after (pcre2el visual-regexp)
  :bind (("C-M-r" . vr/isearch-backward) ; isearch-backward-regexp
         ("C-M-s" . vr/isearch-forward)) ; isearch-forward-regexp
  :config
  (setq vr/engine 'pcre2el)
  )

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )

(use-package zzz-to-char
  :ensure t
  :bind ("M-z" . zzz-to-char)           ; zap-to-char
  )

(use-package autorevert
  :commands auto-revert-mode
  :hook ((conf-unix-mode emacs-lisp-mode sh-mode) . auto-revert-mode)
  )

(use-package bs
  :bind ("C-x C-b" . bs-show)           ; list-buffers
  )

(use-package display-line-numbers
  :commands display-line-numbers-mode
  :hook ((conf-unix-mode emacs-lisp-mode sh-mode) . display-line-numbers-mode)
  )

(use-package generic-x
  )

(use-package hl-line
  :commands hl-line-mode
  :hook ((conf-unix-mode emacs-lisp-mode sh-mode) . hl-line-mode)
  )

(use-package paren
  :commands show-paren-mode
  :hook ((emacs-lisp-mode sh-mode) . show-paren-mode)
  :config
  (setq show-paren-style 'expression)
  )

(bind-keys ("C-c a" . align)
           ("C-c l" . sort-lines))

(when (and (eq system-type 'darwin)
           (>= (user-uid) 1000))
  (setq default-frame-alist '((width . 200) (height . 60)))

  (set-face-attribute 'default nil :family "Ricty Discord" :height 150)

  (scroll-bar-mode 0)
  (tool-bar-mode 0)

  (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

  (use-package all-the-icons
    :ensure t
    )

  (use-package all-the-icons-dired
    :ensure t
    :after (all-the-icons dired)
    :hook (dired-mode . all-the-icons-dired-mode)
    )

  (use-package all-the-icons-ivy
    :ensure t
    :after (all-the-icons ivy)
    :config
    (all-the-icons-ivy-setup)
    )

  (use-package company
    :ensure t
    :commands company-mode
    :hook (emacs-lisp-mode . company-mode)
    )

  (use-package company-box
    :ensure t
    :after company
    :hook (company-mode . company-box-mode)
    )

  (use-package migemo
    :ensure t
    :config
    (setq migemo-coding-system 'utf-8-unix)
    (setq migemo-command "/usr/local/bin/cmigemo")
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-regex-dictionary nil)
    (setq migemo-user-dictionary nil)
    (migemo-init)
    )

  (use-package avy-migemo
    :after migemo
    :config
    (avy-migemo-mode 1)
    )

  (use-package avy-migemo-e.g.ivy
    :after ivy
    )

  (use-package avy-migemo-e.g.counsel
    :after counsel
    )

  (use-package avy-migemo-e.g.swiper
    :after swiper
    )

  (use-package avy-migemo-e.g.zzz-to-char
    :after zzz-to-char
    )

  (use-package yasnippet
    :ensure t
    :commands yas-minor-mode
    :hook ((emacs-lisp-mode sh-mode) . yas-minor-mode)
    )

  (use-package yasnippet-snippets
    :ensure t
    :after yasnippet
    )

  (use-package ivy-yasnippet
    :ensure t
    :after (ivy yasnippet yasnippet-snippets)
    :bind ("C-c y" . ivy-yasnippet)
    )

  (use-package dired
    :commands (dired dired-other-frame dired-other-window)
    :config
    (setq dired-dwim-target t)
    (setq dired-use-ls-dired nil)
    )

  (use-package wdired
    :after dired
    :bind (:map dired-mode-map
                ("C-c w" . wdired-change-to-wdired-mode))
    :config
    (setq wdired-allow-to-change-permissions t)
    )
  )

(unless window-system
  (menu-bar-mode 0)
  )

(use-package init-loader
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load)
  )
