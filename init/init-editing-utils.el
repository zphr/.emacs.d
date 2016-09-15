
;; ---------------------------------------- Whole Line Or Region Mode

(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-mode
  :config (whole-line-or-region-mode t))


;; ---------------------------------------- Goto Last Change

(use-package goto-last-change
  :ensure t
  :config
  (defun my-goto-last-change ()
    (interactive)
    (goto-last-change t 1))
  (global-set-key (kbd "C-M-z") 'goto-last-change))


;; ---------------------------------------- Auto Indent Mode

(use-package auto-indent-mode
  :ensure t
  :defer t
  :config (setq auto-indent-start-org-indent nil))


;; ---------------------------------------- Expand Region

(use-package expand-region
  :ensure t
  :defer t
  :bind ("C-M-S-SPC" . er/expand-region))


;;; ---------------------------------------- Color Identifiers

(use-package color-identifiers-mode
  :ensure t
  :defer t
  :diminish color-identifiers-mode
  :config (progn
	    (setq color-identifiers:max-color-saturation 0.75)
	    (global-color-identifiers-mode t)))


;;; ---------------------------------------- Change Inner

(use-package change-inner
  :ensure t
  :defer t
  :bind ("M-i" . change-inner))


;; --------------------------------------------- Zop To Char

(use-package zop-to-char
  :ensure t
  :defer t
  :bind ("M-z" . zop-up-to-char))

;;; ---------------------------------------- WhiteSpace Cleanup

(use-package whitespace-cleanup-mode
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'whitespace-cleanup-mode))

;;; ---------------------------------------- Misc Commands

(defun join-lines-in-region ()
  (interactive)
  (if (region-active-p)
      (let ((line-count (count-lines (region-beginning) (region-end))))
	(save-excursion
	      (goto-char (region-end))
	      (dotimes (number line-count)
		(delete-indentation))))))

(defun my-delete-indentation ()
  (interactive)
  (if (region-active-p)
      (join-lines-in-region)
    (delete-indentation)))

(global-set-key (kbd "M-J") 'my-delete-indentation)

(provide 'init-editing-utils)
