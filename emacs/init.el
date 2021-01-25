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
           ("M-t"   . mahori:toggle-map)) ; transpose-words

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  )

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  )

(use-package amx
  :ensure t
  )

(use-package ivy
  :ensure t
  :custom
  (ivy-use-virtual-buffers t)
  :config
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1)
  )

(use-package counsel
  :ensure t
  :after (amx ivy)
  :bind (("C-c r" . counsel-recentf)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history))
  :init
  (counsel-mode 1)
  )

(use-package swiper
  :ensure t
  :bind ("C-c s" . swiper)
  )

(use-package avy
  :ensure t
  :bind (("C-h" . avy-goto-line)        ; help-command
         ("C-t" . avy-goto-char-timer)) ; transpose-chars
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

(use-package display-line-numbers
  :bind ("M-t l" . display-line-numbers-mode)
  )

(use-package generic-x
  )

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)           ; list-buffers
  )

(when (and (eq system-type 'darwin)
           (>= (user-uid) 1000))
  (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

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

  (use-package company
    :ensure t
    :commands company-mode
    )

  (use-package all-the-icons
    :ensure t
    )

  (use-package all-the-icons-ivy
    :ensure t
    :after (all-the-icons ivy)
    :hook (after-init . all-the-icons-ivy-setup)
    )

  (use-package all-the-icons-dired
    :ensure t
    :after (all-the-icons dired)
    :hook (dired-mode . all-the-icons-dired-mode)
    )

  (use-package all-the-icons-ibuffer
    :ensure t
    :after (all-the-icons ibuffer)
    :init
    (all-the-icons-ibuffer-mode 1)
    )

  (use-package expand-region
    :ensure t
    :bind ("C-=" . er/expand-region)
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

  (use-package which-key
    :ensure t
    :config
    (which-key-mode 1)
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
  :config
  (setq init-loader-show-log-after-init 'error-only)
  (init-loader-load)
  )
