
;; ---------------------------------------- Helm

(require-package 'helm)
(require 'helm)

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

;; ;; ---------------------------------------- Helm Swoop

;; (require-package 'helm-swoop)
;; (require 'helm-swoop)
;; (setq helm-swoop-speed-or-color t)


;; (require 'hl-line)
;; (set-face-foreground 'helm-swoop-target-line-face nil)
;; (set-face-background 'helm-swoop-target-line-face (face-background 'hl-line))

;; (set-face-foreground 'helm-swoop-target-word-face (face-foreground 'isearch))
;; (set-face-background 'helm-swoop-target-word-face (face-background 'isearch))

;; (global-set-key (kbd "M-i") 'helm-swoop)
;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; ;; (define-key helm-start-map (kbd "s") 'helm-swoop)

;; ;; When doing isearch, hand the word over to helm-swoop
;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)


;; ---------------------------------------- Helm Projectile

(require-package 'projectile)
(require-package 'helm-projectile)
;; (define-key helm-start-map (kbd "p") 'helm-projectile)

;; ---------------------------------------- Helm Tags

(require 'helm-tags)
;; (define-key helm-start-map (kbd "t") 'helm-etags-select)


;; ---------------------------------------- Helm Mini

(require 'helm-imenu)

(require-package 'imenu-anywhere)
(require 'imenu-anywhere)

(global-set-key (kbd "C-c h i") 'helm-imenu-anywhere)

(setq helm-sources-using-default-as-input nil)
(setq helm-mini-default-sources '(helm-source-buffers-list
				  helm-source-bookmarks
				  helm-source-ido-virtual-buffers
				  helm-source-imenu
				  (if (and tags-file-name tags-table-list)
				      helm-source-etags-select)
				  helm-source-buffer-not-found
				  helm-source-files-in-current-dir))

(global-set-key (kbd "C-8") 'helm-mini)

(global-set-key (kbd "C-x C-i") 'helm-imenu)

;;; ---------------------------------------- Helm Pt

(require-package 'helm-pt)
(require 'helm-pt)

(global-set-key (kbd "C-c C-h") 'helm-projectile-pt)


;;; ---------------------------------------- Helm Mark Ring

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

;; (setq helm-buffer-details-flag t)


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


(provide 'init-helm)
