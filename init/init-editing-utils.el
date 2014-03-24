
;; ---------------------------------------- Whole Line Or Region Mode

(require-package 'whole-line-or-region)

(require 'whole-line-or-region)
(whole-line-or-region-mode t)

(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)


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
          (define-key jump-char-isearch-map (kbd "ö") 'jump-char-switch-to-ace)
          (define-key ö-map (kbd "f") 'jump-char-forward)
          (define-key ö-map (kbd "b") 'jump-char-backward)))


;; ---------------------------------------- Expand Region

(require-package 'expand-region)
(require 'expand-region)

(global-set-key (kbd "C-M-S-SPC") 'er/expand-region)


(provide 'init-editing-utils)
