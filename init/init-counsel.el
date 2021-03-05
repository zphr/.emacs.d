
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
  ;; ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ;; ("C-4" . counsel-git-grep)
  ("C-9" . counsel-git)
  ("C-h f" . counsel-describe-function)
  ("C-h v" . counsel-describe-variable)
  ("C-M-y" . counsel-yank-pop)
  ("M-x". counsel-M-x)
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

;;; ---------------------------------------- Ivy-Rich

(use-package ivy-rich
  :ensure t
  :after counsel
  :init (ivy-rich-mode t))


;;; ---------------------------------------- RG

(use-package rg
  :ensure t
  :bind
  (("C-M-4" . rg))
  :config
  (rg-enable-menu)
  (setq rg-command-line-flags '("-C=4")))



(provide 'init-counsel)
;;; init-counsel ends here
