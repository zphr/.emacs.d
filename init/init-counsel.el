
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
  (global-set-key (kbd "C-8") 'my-ivy-switch-buffer))


;;; ---------------------------------------- Swiper

(use-package swiper
  :ensure t
  ;; :bind ("C-s" . swiper)
  )


;;; ---------------------------------------- Counsel

(use-package counsel
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-4" . counsel-git-grep)
  ("C-9" . counsel-git)
  ("C-h f" . counsel-describe-function)
  ("C-h v" . counsel-describe-variable))


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
