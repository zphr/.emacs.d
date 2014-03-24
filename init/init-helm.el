
;; ---------------------------------------- Helm

(require-package 'helm)
(require 'helm)

(require 'helm-config)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "ö") 'helm-execute-persistent-action)

;; (global-unset-key (kbd "C-h"))
;; (define-prefix-command 'helm-start-map)
;; (global-set-key (kbd "C-h") 'helm-start-map)
;; (define-key helm-start-map (kbd "SPC") 'helm-mini)
;; (define-key helm-start-map (kbd "i") 'helm-imenu)
;; (define-key helm-start-map (kbd "f") 'helm-find-files)

(require 'helm-adaptative)
(helm-adaptative-mode 1)

(set-face-attribute 'helm-selection nil :inherit 'hl-line)

;; ---------------------------------------- Helm Swoop

(require-package 'helm-swoop)
(require 'helm-swoop)

(require 'hl-line)
(set-face-foreground 'helm-swoop-target-line-face nil)
(set-face-background 'helm-swoop-target-line-face (face-background 'hl-line))

(set-face-foreground 'helm-swoop-target-word-face (face-foreground 'isearch))
(set-face-background 'helm-swoop-target-word-face (face-background 'isearch))

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; (define-key helm-start-map (kbd "s") 'helm-swoop)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)


;; ---------------------------------------- Helm Projectile

(require-package 'projectile)
(require-package 'helm-projectile)
;; (define-key helm-start-map (kbd "p") 'helm-projectile)

;; ---------------------------------------- Helm Tags

(require 'helm-tags)
;; (define-key helm-start-map (kbd "t") 'helm-etags-select)


;; ---------------------------------------- Helm Mini

(require 'helm-imenu)

(setq helm-mini-default-sources '(helm-source-buffers-list
				  helm-source-ido-virtual-buffers
				  helm-source-imenu
				  helm-source-etags-select
				  helm-source-buffer-not-found
				  helm-source-global-mark-ring
				  helm-source-files-in-current-dir))

(global-set-key (kbd "C-8") 'helm-mini)

(provide 'init-helm)
