
;; ---------------------------------------- Dired

(use-package dired
  :config
  ;; human readable file sizes
  (setq dired-listing-switches "-alh")

  (setq dired-isearch-filenames 'dwim)
  (setq dired-dwim-target t)

  (define-key dired-mode-map (kbd "C-a") 'back-to-indentation))


;; ---------------------------------------- Dired-X

;;; especially usefull for C-x C-j dired-jump
(use-package dired-x)


;;; ---------------------------------------- Dired Hide Details

(add-hook 'dired-mode-hook #'dired-hide-details-mode)


;; ;; ---------------------------------------- Dired-Details and Dired+

;; (use-package dired-details
;;   :if (and (= emacs-major-version 24) (< emacs-minor-version 4))
;;   :ensure t
;;   :defer t
;;   :config (progn
;; 	    (after-load 'dired
;; 	      (require 'dired-details)
;; 	      (setq-default dired-details-hidden-string " ")
;; 	      (dired-details-install)

;; 	      (defun mydired-sort ()
;; 		"Sort dired listings with directories first."
;; 		(save-excursion
;; 		  (let (buffer-read-only)
;; 		    (beginning-of-buffer)
;; 		    (dired-next-line 3)
;; 		    (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
;; 		  (set-buffer-modified-p nil)))

;; 	      (add-hook 'dired-after-readin-hook 'mydired-sort))))

;; (use-package dired+
;;   :config
;;   (setq diredp-file-name font-lock-constant-face)
;;   (setq diredp-dir-priv font-lock-keyword-face)
;;   (setq diredp-ignored-file-name font-lock-comment-face)
;;   (setq diredp-file-suffix font-lock-builtin-face)
;;   (setq diredp-dir-heading font-lock-keyword-face)
;;   (setq diredp-flag-mark font-lock-warning-face)
  
;;   (add-to-list 'dired-compress-file-suffixes 
;;                '("\\.zip\\'" ".zip" "unzip")))

;;; ---------------------------------------- W32 Browser

(use-package w32-browser
  :if (eq system-type 'windows-nt)
  :ensure t)

;;; ---------------------------------------- Dired Narrow

(use-package dired-narrow
  :ensure t
  :config
  (define-key dired-mode-map (kbd "N") 'dired-narrow))

;;; ---------------------------------------- Dired Launch

(use-package dired-launch
  :ensure t
  :config
  (dired-launch-enable))

;;; ---------------------------------------- Mac Dired

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

;; ;;; ---------------------------------------- Dired Sidebar

;; (use-package dired-sidebar
;;   :ensure t
;;   :bind ("C-x C-j" . dired-sidebar-toggle-sidebar)
;;   :commands (dired-sidebar-toggle-sidebar)
;;   :config
;;   (setq dired-sidebar-width 55))


;;; ---------------------------------------- Diredfl

(use-package diredfl
  :ensure t
  :init
  (diredfl-global-mode t))


(provide 'init-dired)
