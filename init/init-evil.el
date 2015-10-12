
;; ---------------------------------------- EVIL

(use-package evil
  :ensure t
  ;; :init
  ;; (dolist (hook '(emacs-startup-hook))
  ;;   (add-hook hook #'evil-mode))
  :init (progn
	  (setq evil-want-C-u-scroll t))
  :config (progn
	    (evil-mode 1)

	    (setcdr evil-insert-state-map nil)
	    (define-key evil-insert-state-map [escape] 'evil-normal-state)

	    (define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)

	    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
	    (define-key evil-insert-state-map (kbd "S-SPC") 'evil-normal-state)
	    (define-key evil-normal-state-map (kbd "S-SPC") 'save-buffer)
	    (define-key evil-normal-state-map (kbd "M-u") 'save-some-buffers)

	    (define-key evil-normal-state-map (kbd "M-n") 'evil-forward-paragraph)
	    (define-key evil-normal-state-map (kbd "M-p") 'evil-backward-paragraph)

	    ;; (define-key evil-normal-state-map (kbd "C-r") 'isearch-backward)
	    ))

(use-package evil-leader
  :ensure t
  :config (progn
	    (global-evil-leader-mode t)
	    (evil-leader/set-leader "<SPC>")

	    (evil-leader/set-key "b" 'helm-mini)
	    (evil-leader/set-key "r" 'jump-to-register)
	    (evil-leader/set-key "g" 'magit-status)
	    (evil-leader/set-key "i" 'helm-imenu)

	    (evil-leader/set-key "hr" 'helm-resume)

	    (evil-leader/set-key "G" 'google-this-lucky-search)

	    (eval-after-load 'shrink-whitespace
	      (evil-leader/set-key "o" 'shrink-whitespace))))


(use-package evil-quickscope
  :ensure t
  :config (global-evil-quickscope-mode t))


(use-package evil-space
  :ensure t
  :init
  (setq evil-space-next-key (kbd "ö"))
  (setq evil-space-prev-key (kbd "Ö"))
  :config (progn
	    (evil-space-mode t)
	    
	    (evil-space-setup "t" ";" ",")
	    (evil-space-setup "f" ";" ",")
	    (evil-space-setup "T" "," ";")
	    (evil-space-setup "F" "," ";")))


(use-package evil-org
  :ensure t
  :init
  (dolist (hook '(org-mode-hook))
    (add-hook hook #'evil-org-mode)))

(provide 'init-evil)
