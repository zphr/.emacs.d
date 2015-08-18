
;; ---------------------------------------- Helm

(use-package projectile
  :ensure t
  :defer t)

(use-package helm
  :ensure t
  :bind (("C-8" . helm-mini)
	 ("C-x C-i" . helm-imenu)
	 ("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x))
  :config (progn
	    (helm-mode 1)

	    (bind-key "M-o" 'helm-buffer-switch-other-window helm-map)
	    (bind-key "M-C-n" 'helm-next-source helm-map)
	    (bind-key "M-C-p" 'helm-previous-source helm-map) 

	    (setq helm-default-external-file-browser "explorer.exe")

	    ;; (set-face-attribute 'helm-selection nil :inherit 'hl-line)

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
	    
	    (defun magit-status-for-helm-bookmark-candidate (candidate)
	      (magit-status (bookmark-get-filename candidate)))

	    (helm-add-action-to-source "Magit" 'magit-status-for-helm-bookmark-candidate helm-source-bookmarks 1)

	    ;; ---------------------------------------- Mini Sources
	    
	    ;; (setq helm-sources-using-default-as-input nil)

	    (setq helm-mini-default-sources '(helm-source-buffers-list
					      helm-source-bookmarks
					      helm-source-ido-virtual-buffers
					      helm-source-buffer-not-found))))

(use-package helm-projectile
  :ensure helm
  :defer t)

(use-package imenu-anywhere
  :ensure helm
  :defer t
  :bind ("C-h i" . helm-imenu-anywhere))

;;; ---------------------------------------- Helm Pt

(use-package helm-pt
  :ensure helm
  :defer t
  :bind ("C-c C-h" . helm-pt-exg-search)
  :config (progn
	    (setq helm-pt-args '("--smart-case" "--parallel"))

	    ;; TODO check this stuff in!
	    (defun helm-pt--process ()
	      "Launch async process to supply candidates."
	      (let ((debug-on-error t)
		    (cmd-line (helm-pt--command helm-pattern)))
		;; Start pt process.
		(prog1            ; This function should return the process first.
		    (start-file-process-shell-command
		     "*helm pt*" helm-buffer cmd-line)
		  ;; Init sentinel.
		  (set-process-sentinel
		   (get-buffer-process helm-buffer)
		   #'(lambda (process event)
		       ;; need to FIX this and actually recognize exit-code
		       (let ((status (process-status process)))
			 (cond ((process-live-p process)
				(helm-process-deferred-sentinel-hook process event helm-ff-default-directory))
			       ((= (process-exit-status process) 2)
				(with-current-buffer helm-buffer
				  (insert (concat "* Exit with code 2, no result found,"
						  " command line was:\n\n "
						  (helm-pt--command helm-pattern)))))
			       ((string= event "finished\n")
				(with-helm-window
				  (force-mode-line-update))
				(message "Finished"))
			       ;; Catch error output in log.
			       (t (helm-log
				   "Error: %s %s"
				   (replace-regexp-in-string "\n" "" event))))))))))

	    (defun helm-pt-exg-search (&optional arg)
	      (interactive "p")
	      (let ((old-idle-delay helm-input-idle-delay))
		(setq helm-input-idle-delay 0.1)
		(if (>= arg 4)
		    (helm-do-pt "d:/Software/")
		  (helm-projectile-pt))
		(setq helm-input-idle-delay old-idle-delay)))

	    (setq helm-input-idle-delay 0.1)

	    (defadvice helm-do-pt (around helm-do-pt-idle-advice activate)
	      (let ((old-input-idle-delay helm-input-idle-delay))
		(setq helm-input-idle-delay 0.1)
		ad-do-it
		(setq helm-input-idle-delay old-input-idle-delay)))

	    (if (string= system-name "BLACKWORTHMOODY")
		(global-set-key (kbd "C-c C-h") 'helm-pt-exg-search)
	      (global-set-key (kbd "C-c C-h") 'helm-projectile-pt))))

;;; ---------------------------------------- Helm LS Git

(use-package helm-ls-git
  :ensure helm
  :bind ("C-9" . helm-browse-project)
  :config (progn
	    (setq helm-ls-git-status-command 'magit-status)))


(provide 'init-helm)
