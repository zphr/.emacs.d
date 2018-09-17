
;;; ---------------------------------------- Ivy

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq-default ivy-wrap t)

  (ivy-mode 1)

  ;; (setq ivy-re-builders-alist
  ;;       '((t . ivy--regex-fuzzy)))

  ;; (setq ivy-initial-inputs-alist nil)

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


;;; ---------------------------------------- Ivy Prescient

(use-package ivy-prescient
  :ensure t
  :after ivy-mode
  :config
  (ivy-prescient-mode t))

;;; ---------------------------------------- Swiper

(use-package swiper
  :ensure t
  :bind
  ("M-s" . swiper)
  ("C-s" . swiper)
  ("C-r" . swiper)
  :config
  (global-set-key (kbd "M-s") 'swiper)
  (define-key swiper-map (kbd "C-ö") 'swiper-avy)
  )


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
  ("C-M-y" . counsel-yank-pop)
  :init

  (setq counsel-rg-base-command
        "rg -i -M 240 --no-heading --line-number --color never %s .")

  (defun my-counsel-git-grep (&optional arg)
    (interactive "P")
    (if arg
        (counsel-git-grep nil (if (region-active-p)
                                  (buffer-substring (region-beginning) (region-end))
                                (symbol-name (symbol-at-point))))
      (counsel-git-grep)))

  ;; (global-set-key (kbd "C-4") 'my-counsel-git-grep)
  (global-set-key (kbd "C-4") 'counsel-rg)

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


;;; ---------------------------------------- Ivy Historian

(use-package ivy-historian
  :ensure t
  :after ivy
  :config
  (ivy-historian-mode +1))


;;; ---------------------------------------- Grep Context

(use-package grep-context
  :ensure t
  :bind
  ("C-M--" . grep-context-less-around-point)
  ("C-M-+" . grep-context-more-around-point))


(provide 'init-counsel)
