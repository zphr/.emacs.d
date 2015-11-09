
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

	    (evil-define-key 'normal emacs-lisp-mode-map "ge" 'eval-last-sexp)

	    (eval-after-load 'omnisharp-mode
	      (progn
		(evil-define-key 'normal omnisharp-mode-map "gd" 'omnisharp-go-to-definition)
		(evil-define-key 'normal omnisharp-mode-map "gb" 'pop-tag-mark)
		(evil-define-key 'normal omnisharp-mode-map "gr" 'omnisharp-helm-find-usages)

		(evil-define-key 'normal omnisharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)))

	    ;; (define-key evil-normal-state-map (kbd "C-r") 'isearch-backward)
	    ))

;;; ---------------------------------------- Evil Quickscope


(use-package evil-quickscope
  :ensure t
  :config (global-evil-quickscope-mode t))


;; ;;; ---------------------------------------- Evil Space

;; (use-package evil-space
;;   :ensure t
;;   :init
;;   (setq evil-space-next-key (kbd "ö"))
;;   (setq evil-space-prev-key (kbd "Ö"))
;;   :config (progn
;; 	    (evil-space-mode t)

;; 	    (evil-space-setup "t" ";" ",")
;; 	    (evil-space-setup "f" ";" ",")
;; 	    (evil-space-setup "T" "," ";")
;; 	    (evil-space-setup "F" "," ";")))



;;; ---------------------------------------- Evil Org

(use-package evil-org
  :ensure t
  :init
  (dolist (hook '(org-mode-hook))
    (add-hook hook #'evil-org-mode)))


;;; ---------------------------------------- Evil Magit

(use-package evil-magit
  :ensure t)


;;; ---------------------------------------- Evil Lisp State

(use-package evil-lisp-state
  :ensure t
  :config
  (setq evil-lisp-state-leader-prefix "m"))


;;; ---------------------------------------- Evil Leader

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>")

  (evil-leader/set-key "b" 'helm-mini)
  (evil-leader/set-key "r" 'jump-to-register)
  (evil-leader/set-key "g" 'magit-status)
  (evil-leader/set-key "i" 'helm-imenu)

  (evil-leader/set-key "hr" 'helm-resume)

  (evil-leader/set-key "G" 'google-this-lucky-search)

  (eval-after-load 'evil-lisp-state
    (progn
      (defun toggle-evil-lisp-state ()
	(interactive)
	(if (evil-lisp-state-p)
	    (evil-normal-state)
	  (evil-lisp-state)))

      (defun go-to-normal-state ()
	(interactive)
	(if (evil-lisp-state-p)
	    (evil-lisp-state)
	  (evil-normal-state)))

      (define-key evil-normal-state-map "ö" 'toggle-evil-lisp-state)
      (define-key evil-lisp-state-map "ö" 'toggle-evil-lisp-state)
      (define-key evil-insert-state-map (kbd "S-SPC") 'go-to-normal-state)))

  (eval-after-load 'shrink-whitespace
    (evil-leader/set-key "o" 'shrink-whitespace)))


;;; ---------------------------------------- Evil Args

(use-package evil-args
  :ensure t
  :config
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  ;; bind evil-forward/backward-args
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  ;; bind evil-jump-out-args
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))



(provide 'init-evil)
;;; init-evil.el ends here
