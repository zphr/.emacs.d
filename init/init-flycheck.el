
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (setq flycheck-javascript-eslint-executable "~/Software/gamebook-portal/node_modules/eslint/bin/eslint.js")

  (global-flycheck-mode t))


(provide 'init-flycheck)
;;; init-flycheck ends here

