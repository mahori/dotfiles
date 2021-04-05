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
