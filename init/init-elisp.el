;; lifted from https://github.com/purcell/emacs.d/blob/master/lisp/init-lisp.el

;; ---------------------------------------- Elisp Slime Nav

(require-package 'elisp-slime-nav)
(after-load 'elisp-slime-nav
  (diminish 'elisp-slime-nav-mode))


;; ;; ---------------------------------------- Pretty Mode

;; (require-package 'pretty-mode)
;; (after-load 'pretty-mode
;;   (require 'pretty-mode)
;;   (autoload 'turn-on-pretty-mode "pretty-mode"))


;; ---------------------------------------- Hippie-expand

(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (make-local-variable 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))


;; ;; ---------------------------------------- Automatic byte compilation

;; (require-package 'auto-compile)
;; (auto-compile-on-save-mode 1)
;; (auto-compile-on-load-mode 1)


;; ---------------------------------------- Misc

(require-package 'rainbow-delimiters)

;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)

;; ---------------------------------------- Paredit

(require-package 'paredit)
(require 'paredit)


;; ---------------------------------------- Eldoc

(after-load 'eldoc
  (diminish 'eldoc-mode))


;; ---------------------------------------- Mode Setup

(add-hook 'emacs-lisp-mode-hook (lambda ()
				   ;; (turn-on-pretty-mode)
				   (turn-on-eldoc-mode)
				   (enable-paredit-mode)
				   (rainbow-delimiters-mode t)
				   (elisp-slime-nav-mode t)
				   (set-up-hippie-expand-for-elisp)))


(provide 'init-elisp)
