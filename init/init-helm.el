
;; ---------------------------------------- Helm

(use-package projectile
  :ensure t)

(use-package helm
  :ensure t
  :config (progn
	    (helm-mode 1)

	    (setq helm-default-external-file-browser "explorer.exe")

	    (require 'helm-config)

	    (global-set-key (kbd "C-x C-f") 'helm-find-files)
	    (global-set-key (kbd "M-x") 'helm-M-x)

	    (global-set-key (kbd "C-c h") 'helm-command-prefix)

	    (when (executable-find "curl")
	      (setq helm-google-suggest-use-curl-p t))

	    (require 'helm-adaptive)
	    (helm-adaptive-mode 1)

	    (setq helm-buffers-fuzzy-matching t)

	    (set-face-attribute 'helm-selection nil :inherit 'hl-line)

	    (define-key helm-map (kbd "M-o") 'helm-buffer-switch-other-window)
	    (define-key helm-map (kbd "M-C-n") 'helm-next-source)
	    (define-key helm-map (kbd "M-C-p") 'helm-previous-source)

	    (require 'helm-tags)

            ;;; ---------------------------------------- Fuzzy Matching
	    (setq helm-recentf-fuzzy-match t)
	    (setq helm-buffers-fuzzy-matching t)
	    (setq helm-recentf-fuzzy-match t)
	    (setq helm-buffers-fuzzy-matching t)
	    (setq helm-find-files t)
	    (setq helm-locate-fuzzy-match nil)
	    (setq helm-M-x-fuzzy-match t)
	    (setq helm-semantic-fuzzy-match t)
	    (setq helm-imenu-fuzzy-match t)
	    (setq helm-apropos-fuzzy-match t)
	    (setq helm-lisp-fuzzy-completion t)

	    (setq helm-sources-using-default-as-input nil)

	    (global-set-key (kbd "C-8") 'helm-mini)

	    (global-set-key (kbd "C-x C-i") 'helm-imenu)

	    ;; ---------------------------------------- Input In Header 
	    (setq helm-echo-input-in-header-line t)

	    (defun helm-hide-minibuffer-maybe ()
	      (when (with-helm-buffer helm-echo-input-in-header-line)
		(let ((ov (make-overlay (point-min) (point-max) nil nil t)))
		  (overlay-put ov 'window (selected-window))
		  (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
					  `(:background ,bg-color :foreground ,bg-color)))
		  (setq-local cursor-type nil))))

	    (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)

	    ;; ---------------------------------------- Helm Mark Ring
	    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
	    
	    (use-package helm-projectile
	      :ensure t)

	    (use-package imenu-anywhere
	      :ensure t
	      :bind ("C-c h i" . helm-imenu-anywhere)
	      :config (progn
			(add-to-list 'helm-mini-default-sources helm-source-imenu-anywhere)))

	    ;;; ---------------------------------------- Helm Pt
	    
	    (use-package helm-pt
	      :ensure t
	      :config (progn
			(defun helm-pt-exg-search (&optional arg)
			  (interactive "p")
			  (if (>= arg 4)
			      (helm-do-pt "d:/Software/")
			    (helm-projectile-pt)))

			(if (string= system-name "BLACKWORTHMOODY")
			    (global-set-key (kbd "C-c C-h") 'helm-pt-exg-search)
			  (global-set-key (kbd "C-c C-h") 'helm-projectile-pt))))


	    ;; ---------------------------------------- Mini Sources

	    (setq helm-mini-default-sources '(helm-source-buffers-list
					      helm-source-bookmarks
					      helm-source-ido-virtual-buffers
					      helm-source-buffer-not-found))
	    )
  )


(provide 'init-helm)
