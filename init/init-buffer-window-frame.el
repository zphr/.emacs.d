
;; ---------------------------------------- Popwin

(use-package popwin
  :ensure t
  :config (popwin-mode 1))


;; ;; ---------------------------------------- Ace Window

;; (use-package ace-window
;;   :ensure t
;; :defer t
;;   :bind ("C-S-o" . ace-window)
;;   :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; ---------------------------------------- Switch Window

(use-package switch-window
  :ensure t
  :bind 
  ("C-S-o" . switch-window)
  :config (progn
	    (defadvice switch-window (before switch-frame-if-just-one-window activate)
	      "Switch to other frame if only one window exists"
	      (if (< (length (window-list)) 2)
		  (other-frame 1)))))

;;; ---------------------------------------- IBuffer

(use-package ibuffer
  :ensure t
:defer t
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


;; ;;; ---------------------------------------- Perspective

;; (use-package perspective
;;   :ensure t
;;   :bind
;;   ("M-C-)" . persp-switch)
;;   ("M-C-9" . persp-switch-last)
;;   :config
;;   (persp-mode t))


;;; ---------------------------------------- WorkGroups 2

(use-package workgroups2
  :ensure t
  :bind
  ("M-C-)" . wg-switch-to-workgroup)
  ("M-C-9" . wg-switch-to-previous-workgroup)
  :config
  (workgroups-mode t))


;;; ---------------------------------------- Window Numbering

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode t))


(provide 'init-buffer-window-frame)
