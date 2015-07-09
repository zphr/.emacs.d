
;; ---------------------------------------- Popwin

(use-package popwin
  :ensure t
  :bind ("<f8>" . popwin:keymap)
  :config (popwin-mode 1))


;; ---------------------------------------- Ace Window

(use-package ace-window
  :ensure t
  :bind ("C-S-o" . ace-window)
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; ;; ---------------------------------------- Switch Window

;; (require-package 'switch-window)

;; (defadvice switch-window (before switch-frame-if-just-one-window activate)
;;   "Switch to other frame if only one window exists"
;;   (if (< (length (window-list)) 2)
;;       (other-frame 1)))

;; (global-set-key (kbd "C-S-o") 'switch-window)

;;; ---------------------------------------- IBuffer

(use-package ibuffer
  :ensure t
  :config (progn
	    (setq ibuffer-show-empty-filter-groups nil)

	    (setq ibuffer-saved-filter-groups
		  (quote (("default"
			   ("EShell"
			    (mode . eshell-mode))
			   ("Init"
			    (name . "init"))
			   ("Pflanzen"
			    (filename . "/OSGProjekt1/"))
			   ("Praktikum"
			    (filename . "/PraktikumsProjekt/"))
			   ("Org-Mode" ;; all org-related buffers
			    (mode . org-mode))
			   ("Twitter"
			    (mode . twittering-mode))
			   ("Dired"
			    (mode . dired-mode))
			   ("Info"
			    (mode . Info-mode))
			   ("Programming"
			    (or
			     (mode . c++-mode)
			     (mode . c-mode)
			     (mode . perl-mode)
			     (mode . python-mode)
			     (mode . csharp-mode)
			     (mode . emacs-lisp-mode)))
			   ("Version Control"
			    (name . "*vc-"))
			   ("LaTeX"
			    (mode . latex-mode)
			    (mode . bibtex-mode))
			   ("Image"
			    (mode . image-mode))))))

	    (add-hook 'ibuffer-mode-hook
		      (lambda ()
			(ibuffer-auto-mode 1)
			(ibuffer-switch-to-saved-filter-groups "default")))))


(provide 'init-buffer-window-frame)
