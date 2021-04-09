(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(cond ((gnutls-available-p)
       (when (eq system-type 'gnu/linux)
         (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
         (setq package-check-signature nil))
       (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
      (t
       (add-to-list 'package-archives '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/") t)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq-default indent-tabs-mode nil)

(setq history-delete-duplicates t)
(setq history-length (* history-length 10))
(setq inhibit-startup-screen t)

(column-number-mode 1)
(save-place-mode 1)
(savehist-mode 1)

(define-prefix-command 'mahori:toggle-map)
(bind-keys ("C-c a" . align)
           ("C-c l" . sort-lines)
           ("M-t"   . mahori:toggle-map))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  )

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  )

(use-package amx
  :ensure t
  )

(use-package ivy
  :ensure t
  :hook (after-init . ivy-mode)
  :custom
  (ivy-use-virtual-buffers t)
  :config
  (setq enable-recursive-minibuffers t)
  )

(use-package counsel
  :ensure t
  :after (amx ivy)
  :bind (("C-c r" . counsel-recentf)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history))
  :hook (ivy-mode . counsel-mode)
  )

(use-package swiper
  :ensure t
  :bind ("C-c s" . swiper)
  )

(use-package avy
  :ensure t
  :bind (("C-h" . avy-goto-line)
         ("C-t" . avy-goto-char-timer))
  )

(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2)
  )

(use-package recentf-ext
  :ensure t
  :hook (after-init . recentf-mode)
  :config
  (setq recentf-max-saved-items (* recentf-max-saved-items 10))
  )

(use-package visual-regexp
  :ensure t
  :bind (("M-%"   . vr/query-replace)
         ("C-c m" . vr/mc-mark))
  )

(use-package pcre2el
  :ensure t
  :after visual-regexp
  )

(use-package visual-regexp-steroids
  :ensure t
  :after (pcre2el visual-regexp)
  :custom
  (vr/engine 'pcre2el)
  )

(use-package display-line-numbers
  :bind ("M-t l" . display-line-numbers-mode)
  )

(use-package generic-x
  )

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  )

(when (and (eq system-type 'darwin)
           (>= (user-uid) 1000))
  (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

  (use-package migemo
    :ensure t
    :custom
    (migemo-coding-system 'utf-8-unix)
    (migemo-command "/usr/local/bin/cmigemo")
    (migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (migemo-options '("-q" "--emacs"))
    (migemo-regex-dictionary nil)
    (migemo-user-dictionary nil)
    :config
    (migemo-init)
    )

  (use-package company
    :ensure t
    :commands company-mode
    )

  (use-package ivy-rich
    :ensure t
    :after ivy
    :hook (ivy-mode . ivy-rich-mode)
    )

  (use-package all-the-icons
    :ensure t
    )

  (use-package all-the-icons-ivy
    :ensure t
    :after (all-the-icons ivy)
    :hook (ivy-mode . all-the-icons-ivy-setup)
    )

  (use-package all-the-icons-ivy-rich
    :ensure t
    :after (all-the-icons ivy-rich)
    :init
    (all-the-icons-ivy-rich-mode 1)
    )

  (use-package all-the-icons-dired
    :ensure t
    :after (all-the-icons dired)
    :hook (dired-mode . all-the-icons-dired-mode)
    )

  (use-package all-the-icons-ibuffer
    :ensure t
    :after (all-the-icons ibuffer)
    :hook (ibuffer-mode . all-the-icons-ibuffer-mode)
    )

  (use-package expand-region
    :ensure t
    :bind ("C-=" . er/expand-region)
    )

  (use-package irony
    :ensure t
    :commands irony-mode
    :hook (irony-mode . irony-cdb-autosetup-compile-options)
    )

  (use-package company-irony
    :ensure t
    :after (company irony)
    :init
    (add-to-list 'company-backends 'company-irony)
    )

  (use-package company-irony-c-headers
    :ensure t
    :after company-irony
    :init
    (add-to-list 'company-backends 'company-irony-c-headers)
    )

  (use-package minimap
    :ensure t
    :bind ("M-t m" . minimap-mode)
    :custom
    (minimap-window-location 'right)
    )

  (use-package multiple-cursors
    :ensure t
    :bind (("C-S-c C-S-c" . mc/edit-lines)
           ("C-<"         . mc/mark-previous-like-this)
           ("C->"         . mc/mark-next-like-this)
           ("C-c C-<"     . mc/mark-all-like-this))
    )

  (use-package projectile
    :ensure t
    :bind (:map projectile-mode-map
                ("C-c p" . projectile-command-map))
    )

  (use-package counsel-projectile
    :ensure t
    :bind ("M-t p" . counsel-projectile-mode)
    )

  (use-package which-key
    :ensure t
    :hook (after-init . which-key-mode)
    )

  (use-package yasnippet
    :ensure t
    :commands yas-minor-mode
    )

  (use-package yasnippet-snippets
    :ensure t
    :after yasnippet
    )

  (use-package ivy-yasnippet
    :ensure t
    :after (ivy yasnippet)
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
  :ensure t
  :custom
  (init-loader-show-log-after-init 'error-only)
  :config
  (init-loader-load)
  )
