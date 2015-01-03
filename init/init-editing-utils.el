
;; ---------------------------------------- Whole Line Or Region Mode

(require-package 'whole-line-or-region)

(require 'whole-line-or-region)
(whole-line-or-region-mode t)

(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; ;; ---------------------------------------- Easy Kill

;; (require-package 'easy-kill)
;; (require 'easy-kill)

;; (global-set-key [remap kill-ring-save] 'easy-kill)

;; (define-key easy-kill-base-map "p" 'easy-kill-shrink)
;; (define-key easy-kill-base-map "n" 'easy-kill-expand)


;; ---------------------------------------- Goto Last Change

(require-package 'goto-last-change)
(global-set-key (kbd "C-M-z") 'goto-last-change)


;; ---------------------------------------- Auto Indent Mode

(require-package 'auto-indent-mode)
(require 'auto-indent-mode)

(setq auto-indent-start-org-indent nil)

;; ---------------------------------------- Align

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-current (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))


;; ---------------------------------------- Jump Char

(require-package 'jump-char)
(require 'jump-char)

(eval-after-load "jump-char"
  '(progn (define-key jump-char-isearch-map (kbd "<return>") 'jump-char-exit)
	  (global-set-key (kbd "M-f") 'jump-char-forward)
	  (global-set-key (kbd "M-b") 'jump-char-backward)))


;; ---------------------------------------- Expand Region

(require-package 'expand-region)
(require 'expand-region)

(global-set-key (kbd "C-M-S-SPC") 'er/expand-region)


;; ;;; ---------------------------------------- Yasnippet

;; (require-package 'yasnippet)
;; (yas-global-mode 1)


;; ;;; ---------------------------------------- Color Identifiers

;; (require-package 'color-identifiers-mode)
;; (require 'color-identifiers-mode)

;; (setq color-identifiers:max-color-saturation 0.75)
;; (global-color-identifiers-mode t)


;;; ---------------------------------------- Change Inner

(require-package 'change-inner)
(require 'change-inner)
(global-set-key (kbd "M-i") 'change-inner)
;; (global-set-key (kbd "M-o") 'change-outer)


(provide 'init-editing-utils)
