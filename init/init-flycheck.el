
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t)
  (setq flycheck-javascript-eslint-executable "~/Software/gamebook-portal/node_modules/eslint/bin/eslint.js"))


(provide 'init-flycheck)
;;; init-flycheck ends here

