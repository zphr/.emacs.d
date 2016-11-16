
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (setq flycheck-javascript-eslint-executable "~/Software/gamebook-portal/node_modules/eslint/bin/eslint.js")

  (global-flycheck-mode t))


;;; ---------------------------------------- Flycheck Pos Tip

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode +1))


(provide 'init-flycheck)
;;; init-flycheck ends here

