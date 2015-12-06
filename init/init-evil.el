
;; ---------------------------------------- EVIL

(use-package evil
  :ensure t
  ;; :init
  ;; (dolist (hook '(emacs-startup-hook))
  ;;   (add-hook hook #'evil-mode))
  :init
  (setq evil-want-C-u-scroll t)
  :config
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

  (evil-define-key 'motion help-mode-map "i" 'forward-button)
  (evil-define-key 'motion help-mode-map "I" 'backward-button)

  (with-eval-after-load 'diff-hl
    (evil-define-key 'normal prog-mode-map "gj" 'diff-hl-next-hunk)
    (evil-define-key 'normal prog-mode-map "gk" 'diff-hl-previous-hunk)
    (evil-define-key 'normal prog-mode-map "gr" 'diff-hl-revert-hunk)
    (evil-define-key 'normal prog-mode-map "gc" 'diff-hl-diff-goto-hunk))

  ;; ---------------------------------------- Comment Text Object

  (defun beginning-of-previous-line ()
    (save-excursion (beginning-of-line 0) (point)))

  (defun beginning-of-comment ()
    (interactive)
    (let ((start-point (point)))
      (save-excursion
	(while (re-search-backward comment-start (beginning-of-previous-line) t))
	(beginning-of-line)
	(point))))

  (defun end-of-next-line ()
    (save-excursion (end-of-line 2) (point)))

  (defun end-of-comment ()
    (interactive)
    (save-excursion
      (end-of-line)
      (while (re-search-forward comment-start (end-of-next-line) t))
      (end-of-line)
      (point)))

  (defun get-comment-start-end ()
    (interactive)
    (let* ((start (beginning-of-comment))
	   (end (end-of-comment)))
      (list start end)))

  (defun select-comment-region ()
    (interactive)
    (let* ((selected-region (get-comment-start-end)))
      (set-mark (nth 0 selected-region))
      (goto-char (nth 1 selected-region))))

  (evil-define-text-object inner-comment-region (&optional count begin end type)
    "blub"
    (let ((selected-region (get-comment-start-end)))
      (if selected-region
	  (evil-range (nth 0 selected-region) (nth 1 selected-region)))))

  (define-key evil-inner-text-objects-map "C" 'inner-comment-region)
  (define-key evil-outer-text-objects-map "C" 'inner-comment-region)


  ;; ---------------------------------------- Defun Text Object
  (evil-define-text-object evil-defun-text-object (&optional count begin end type)
    "blub"
    (evil-range (save-excursion (beginning-of-defun) (point)) (save-excursion (end-of-defun) (point))))

  (define-key evil-inner-text-objects-map "F" 'evil-defun-text-object)
  (define-key evil-outer-text-objects-map "F" 'evil-defun-text-object)


  ;; ---------------------------------------- Defun Text Object
  (evil-define-text-object evil-method-text-object (&optional count begin end type)
    "blub"
    (evil-range (save-excursion (c-beginning-of-defun) (point)) (save-excursion (c-end-of-defun) (point))))

  (define-key evil-inner-text-objects-map "M" 'evil-method-text-object)
  (define-key evil-outer-text-objects-map "M" 'evil-method-text-object)


  ;; ---------------------------------------- Package Mode
  (with-eval-after-load 'package
    (add-to-list 'evil-normal-state-modes 'package-menu-mode)

    (evil-add-hjkl-bindings package-menu-mode-map)

    (evil-define-key 'normal package-menu-mode-map "/" 'evil-search-forward
      "i" 'package-menu-mark-install
      "q" 'quit-window
      "u" 'package-menu-mark-unmark
      "gr" 'revert-buffer
      "x" 'package-menu-execute
      "v" 'package-menu-describe-package))

  ;; ---------------------------------------- Prodigy
  (with-eval-after-load 'prodigy
    (add-to-list 'evil-normal-state-modes 'prodigy-mode)

    (evil-add-hjkl-bindings prodigy-mode-map)

    (evil-define-key 'normal prodigy-mode-map "/" 'evil-search-forward
      "q" 'quit-window
      "s" 'prodigy-start
      "S" 'prodigy-stop
      "m" 'prodigy-mark
      "u" 'prodigy-unmark
      "U" 'prodigy-unmark-all))

  ;; ---------------------------------------- Elisp Mode
  (evil-define-key 'normal emacs-lisp-mode-map "ge" 'eval-last-sexp)

  (with-eval-after-load 'omnisharp
    (progn
      (evil-define-key 'normal omnisharp-mode-map "gd" 'omnisharp-go-to-definition)
      (evil-define-key 'normal omnisharp-mode-map "gb" 'pop-tag-mark)
      (evil-define-key 'normal omnisharp-mode-map "gr" 'omnisharp-helm-find-usages)

      (evil-define-key 'normal omnisharp-mode-map (kbd "M-.") 'omnisharp-go-to-definition)))

  ;; ---------------------------------------- Helm
  (with-eval-after-load 'helm-mode
    (with-eval-after-load 'hydra
      (defhydra helm-like-unite ()
	"vim movement"
	("?" helm-help "help")
	("S-<SPC>" keyboard-escape-quit "exit")
	("<SPC>" helm-toggle-visible-mark "mark")
	("a" helm-toggle-all-marks "(un)mark all")
	;; not sure if there's a better way to do this
	("/" (lambda ()
	       (interactive)
	       (execute-kbd-macro [?\C-s]))
	 "search")
	("v" helm-execute-persistent-action)
	("g" helm-beginning-of-buffer "top")
	("G" helm-end-of-buffer "bottom")
	("p" helm-previous-source "next")
	("n" helm-next-source "previous")
	("j" helm-next-line "down")
	("k" helm-previous-line "up")
	("i" nil "cancel"))

      (define-key helm-map (kbd "ö") 'helm-like-unite/body)))

  ;; ---------------------------------------- Evil Text Objects

  (setq evil-move-defun-alist
	'((ruby-mode . (ruby-beginning-of-defun . ruby-end-of-defun))
	  (c-mode    . (c-beginning-of-defun . c-end-of-defun))
	  (js2-mode  . (js2-beginning-of-defun . js2-end-of-defun))
	  (csharp-mode  . (c-beginning-of-defun . c-end-of-defun))))

  (defun evil-move-defun (count &optional begin-defun end-defun)
    "Move by defun"
    (let ((count (or count 1))
	  (begin-defun (or begin-defun 'beginning-of-defun))
	  (end-defun (or end-defun 'end-of-defun)))
      (evil-motion-loop (var count)
	(cond
	 ((< var 0) (funcall begin-defun))
	 (t         (funcall end-defun))))))

  (evil-define-text-object evil-a-defun (count)
    "Select a defun."
    (let* ((mode-defuns (cdr-safe (assq major-mode evil-move-defun-alist)))
	   (begin-defun (car-safe mode-defuns))
	   (end-defun (cdr-safe mode-defuns)))
      (evil-an-object-range count
			    (lambda (count) (evil-move-defun count begin-defun end-defun))
			    nil nil nil)))

  (define-key evil-outer-text-objects-map "f" 'evil-a-defun)

  ;; ---------------------------------------- Subword Settings
  (global-subword-mode 1)

  (define-category ?U "Uppercase")
  (define-category ?u "Lowercase")
  (modify-category-entry (cons ?A ?Z) ?U)
  (modify-category-entry (cons ?a ?z) ?u)
  (make-variable-buffer-local 'evil-cjk-word-separating-categories)
  (add-hook 'subword-mode-hook
	    (lambda ()
	      (if subword-mode
		  (push '(?u . ?U) evil-cjk-word-separating-categories)
		(setq evil-cjk-word-separating-categories
		      (default-value 'evil-cjk-word-separating-categories))))))

;;; ---------------------------------------- Evil Quickscope


(use-package evil-quickscope
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'turn-on-evil-quickscope-mode))


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


;; ;;; ---------------------------------------- Evil Lisp State

;; (use-package evil-lisp-state
;;   :ensure t
;;   :config
;;   (setq evil-lisp-state-leader-prefix "m"))


;;; ---------------------------------------- Evil Leader

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode t)
  (evil-leader/set-leader "<SPC>")

  (evil-leader/set-key "b" 'helm-mini)
  (evil-leader/set-key "r" 'jump-to-register)
  (evil-leader/set-key "i" 'helm-imenu)
  (evil-leader/set-key "x" 'helm-M-x)
  (evil-leader/set-key "f" 'helm-find-files)

  (evil-leader/set-key "wo" 'delete-other-windows)
  (evil-leader/set-key "ws" 'evil-window-split)
  (evil-leader/set-key "wv" 'evil-window-vsplit)
  (evil-leader/set-key "wb" 'bury-buffer)

  (evil-leader/set-key "c" 'comment-dwim)

  (evil-leader/set-key-for-mode 'emacs-lisp-mode "c" 'paredit-comment-dwim)
  (evil-leader/set-key-for-mode 'emacs-lisp-mode "e" 'eval-last-sexp)

  (evil-leader/set-key "x" 'helm-M-x)

  (evil-leader/set-key "hr" 'helm-resume)

  (evil-leader/set-key "/" 'google-this-lucky-search)

  (with-eval-after-load 'omnisharp
    (evil-leader/set-key "o" 'hydra-omnisharp/body))

  (with-eval-after-load 'diff-hl
   (evil-leader/set-key "g" 'hydra-diff-hl/body))

  (with-eval-after-load 'google-this
    (evil-leader/set-key "G" 'google-this))

  (with-eval-after-load 'evil-lisp-state
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


;;; ---------------------------------------- Evil Escape

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode 1)
  (setq-default evil-escape-key-sequence "jk"))


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


;;; ---------------------------------------- Evil Paredit

(use-package evil-paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'evil-paredit-mode))


;;; ---------------------------------------- Evil Textobj Anyblock

(use-package evil-textobj-anyblock
  :ensure t
  :config
  (define-key evil-inner-text-objects-map "b" 'evil-textobj-anyblock-inner-block)
  (define-key evil-outer-text-objects-map "b"'evil-textobj-anyblock-a-block))

;;; ---------------------------------------- Evil Match It

(use-package evil-matchit
  :ensure t
  :config
  (with-eval-after-load 'csharp-mode
    (mapc (lambda (mode)
	    (plist-put evilmi-plugins mode '((evilmi-c-get-tag evilmi-c-jump)
					     (evilmi-simple-get-tag evilmi-simple-jump)))
	    )
	  '(csharp-mode))))

(provide 'init-evil)
;;; init-evil.el ends here
