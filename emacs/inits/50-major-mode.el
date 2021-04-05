(defun mahori:default-mode-hook ()
  (display-line-numbers-mode 1)
  )

(defun mahori:dns-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 8)
  (mahori:default-mode-hook)
  )

(add-hook 'conf-unix-mode-hook 'mahori:default-mode-hook)
(add-hook 'default-generic-mode-hook 'mahori:default-mode-hook)
(add-hook 'dns-mode-hook 'mahori:dns-mode-hook)
(add-hook 'etc-passwd-generic-mode-hook 'mahori:default-mode-hook)
(add-hook 'etc-sudoers-generic-mode-hook 'mahori:default-mode-hook)
(add-hook 'hosts-generic-mode-hook 'mahori:default-mode-hook)
(add-hook 'm4-mode-hook 'mahori:default-mode-hook)

(when (file-exists-p "/usr/bin/docker")
  (use-package dockerfile-mode
    :ensure t
    :hook (dockerfile-mode . mahori:default-mode-hook)
    )

  (use-package docker-compose-mode
    :ensure t
    :hook (docker-compose-mode . mahori:default-mode-hook)
    )
  )
