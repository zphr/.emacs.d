
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
	    (evil-leader/set-leader "ö")

	    (evil-leader/set-key "b" 'helm-mini)
	    (evil-leader/set-key "r" 'jump-to-register)
	    (evil-leader/set-key "g" 'magit-status)))

(use-package evil-quickscope
  :ensure t
  :config (global-evil-quickscope-mode t))

(use-package evil-space
  :ensure t
  :config (progn
	    (evil-space-mode)

	    (setq evil-space-prev-key (kbd "M-SPC"))
	    
	    (evil-space-setup "t" ";" ",")
	    (evil-space-setup "f" ";" ",")
	    (evil-space-setup "T" "," ";")
	    (evil-space-setup "F" "," ";")))

(provide 'init-evil)
