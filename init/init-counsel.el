
;;; ---------------------------------------- Ivy

(use-package ivy
  :ensure t
  ;; :bind
  ;; ("C-8" . ivy-switch-buffer)
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-fixed-height-minibuffer 15)
  (setq ivy-height 15)

  (defun my-ivy-switch-buffer (&optional arg)
    (interactive "P")
    (if arg
        (ivy-switch-buffer-other-window)
      (ivy-switch-buffer)))
  (global-set-key (kbd "C-8") 'my-ivy-switch-buffer)

  (with-eval-after-load 'key-chord
    (key-chord-define-global (kbd "jk") 'my-ivy-switch-buffer)))


;;; ---------------------------------------- Swiper

(use-package swiper
  :ensure t
  :bind ("M-s" . swiper))


;;; ---------------------------------------- Counsel

(use-package counsel
  :ensure t
  :functions counsel-git-grep
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ;; ("C-4" . counsel-git-grep)
  ("C-9" . counsel-git)
  ("C-h f" . counsel-describe-function)
  ("C-h v" . counsel-describe-variable)
  :init

  (defun my-counsel-git-grep (&optional arg)
    (interactive "P")
    (if arg
        (counsel-git-grep nil (symbol-name (symbol-at-point)))
      (counsel-git-grep)))

  (defun my-counsel-rg (&optional arg)
    (interactive "P")
    (if arg
        (counsel-rg (symbol-name (symbol-at-point)))
      (counsel-rg)))

  (global-set-key (kbd "C-4") 'my-counsel-git-grep)

  :config
  (setq counsel-find-file-at-point t)
  (with-eval-after-load 'key-chord
    (key-chord-define-global (kbd "df") 'counsel-git)))


;;; ---------------------------------------- Counsel Dash

(use-package counsel-dash
  :ensure t
  :bind
  ("C-h d" . counsel-dash)
  :config
  (defun counsel-dash-js ()
    (interactive)
    (setq-local counsel-dash-docsets '("Lo-Dash")))

  (add-hook 'web-mode-hook 'counsel-dash-js))


(provide 'init-counsel)
