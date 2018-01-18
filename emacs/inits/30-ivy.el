(use-package counsel
  :ensure t
  :diminish ivy-mode
  :bind (("C-c g"   . counsel-ag)
         ("C-c r"   . counsel-recentf)
         ("C-c x"   . counsel-M-x)
         ("C-s"     . swiper)                     ; isearch-forward
         ("C-x C-f" . counsel-find-file)          ; find-file
         ("M-y"     . counsel-yank-pop)           ; yank-pop
         ("<f1> b"  . counsel-descbinds)          ; describe-bindings
         ("<f1> f"  . counsel-describe-function)  ; describe-function
         ("<f1> v"  . counsel-describe-variable)) ; describe-variable
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(use-package avy-migemo-e.g.ivy
  :ensure avy-migemo
  )

(use-package avy-migemo-e.g.swiper
  :ensure avy-migemo
  )

(use-package avy-migemo-e.g.counsel
  :ensure avy-migemo
  )
