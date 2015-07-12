
;; ---------------------------------------- Whole Line Or Region Mode

(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-mode
  :config (whole-line-or-region-mode t))


;; ---------------------------------------- Goto Last Change

(use-package goto-last-change
  :ensure t
  :bind ("C-M-z" . goto-last-change))


;; ---------------------------------------- Auto Indent Mode

(use-package auto-indent-mode
  :ensure t
  :config (setq auto-indent-start-org-indent nil))


;; ---------------------------------------- Expand Region

(use-package expand-region
  :ensure t
  :bind ("C-M-S-SPC" . er/expand-region))


;;; ---------------------------------------- Color Identifiers

(use-package color-identifiers-mode
  :ensure t
  :diminish color-identifiers-mode
  :config (progn
	    (setq color-identifiers:max-color-saturation 0.75)
	    (global-color-identifiers-mode t)))


;;; ---------------------------------------- Change Inner

(use-package change-inner
  :ensure t
  :bind ("M-i" . change-inner))


;; --------------------------------------------- Zop To Char

(use-package zop-to-char
  :ensure t
  :bind ("M-z" . zop-up-to-char))


(provide 'init-editing-utils)
