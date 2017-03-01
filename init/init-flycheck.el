
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t))


;;; ---------------------------------------- Flycheck Pos Tip

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode +1))


(provide 'init-flycheck)
;;; init-flycheck ends here

