
;; ---------------------------------------- Dired

(require 'dired)
(setq dired-isearch-filenames 'dwim)
(setq dired-dwim-target t)

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
(define-key dired-mode-map (kbd "M-+") 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
(define-key dired-mode-map (kbd "M-#") 'dired-jump-to-bottom)

(define-key dired-mode-map (kbd "C-a") 'back-to-indentation)

;; ---------------------------------------- Dired-X

;;; especially usefull for C-x C-j dired-jump
(require 'dired-x)


;; ---------------------------------------- Dired-Details and Dired+

(use-package dired-details
  :if (and (= emacs-major-version 24) (< emacs-minor-version 4))
  :ensure t
  :config (progn
	    (after-load 'dired
	      (require 'dired-details)
	      (setq-default dired-details-hidden-string " ")
	      (dired-details-install)

	      (defun mydired-sort ()
		"Sort dired listings with directories first."
		(save-excursion
		  (let (buffer-read-only)
		    (beginning-of-buffer)
		    (dired-next-line 3)
		    (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
		  (set-buffer-modified-p nil)))

	      (add-hook 'dired-after-readin-hook 'mydired-sort))))

(use-package dired+
  :ensure t
  :config (progn
	    (setq diredp-file-name font-lock-constant-face)
	    (setq diredp-dir-priv font-lock-keyword-face)
	    (setq diredp-ignored-file-name font-lock-comment-face)
	    (setq diredp-file-suffix font-lock-builtin-face)
	    (setq diredp-dir-heading font-lock-keyword-face)
	    ;; (setq diredp-flag-mark-line compilation-info-face)
	    (setq diredp-flag-mark font-lock-warning-face)
	    
	    (add-to-list 'dired-compress-file-suffixes 
			 '("\\.zip\\'" ".zip" "unzip"))))

(use-package w32-browser
  :if (eq system-type 'windows-nt)
  :ensure t)


;; ;;; ---------------------------------------- Dired Async
;; (require-package 'async)
;; (when (require 'dired-aux)
;;    (require 'dired-async))

(provide 'init-dired)
