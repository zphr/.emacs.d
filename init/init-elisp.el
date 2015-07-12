;; lifted from https://github.com/purcell/emacs.d/blob/master/lisp/init-lisp.el

;; ---------------------------------------- Elisp Slime Nav

(use-package elisp-slime-nav
  :ensure t
  :diminish elisp-slime-nav-mode)


;; ---------------------------------------- Hippie-expand

(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (make-local-variable 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))


;; ---------------------------------------- Misc

(use-package rainbow-delimiters
  :ensure t)

;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)


;; ---------------------------------------- Paredit

(use-package paredit
  :ensure t)


;; ---------------------------------------- Eldoc

(after-load 'eldoc
  (diminish 'eldoc-mode))


;; ---------------------------------------- Mode Setup

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (turn-on-eldoc-mode)
				  (enable-paredit-mode)
				  (rainbow-delimiters-mode t)
				  (elisp-slime-nav-mode t)
				  (set-up-hippie-expand-for-elisp)))


(provide 'init-elisp)
