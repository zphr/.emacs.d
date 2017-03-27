
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t)

  (setq flycheck-javascript-eslint-executable "eslint_d"))


;;; ---------------------------------------- Flycheck Pos Tip

(use-package flycheck-pos-tip
  :if (not (eq system-type 'darwin))
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode +1))


(provide 'init-flycheck)
;;; init-flycheck ends here

