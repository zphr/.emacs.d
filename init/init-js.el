
;;; ---------------------------------------- Tern

(require-package 'tern)
(require 'tern)


;;; ---------------------------------------- Company Tern

(require-package 'company-tern)
(require 'company-tern)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))

;;; ---------------------------------------- JS2 Mode

;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

(add-hook 'js2-mode-hook (lambda () (flycheck-mode 1)))

(require 'js2-imenu-extras)
(js2-imenu-extras-setup)

(eval-after-load 'align
  '(add-to-list 'align-c++-modes 'js2-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-highlight-level 3)

;;; ---------------------------------------- JS2 Refactor

(require-package 'js2-refactor)
(require 'js2-refactor)

(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")


(provide 'init-js)
;;; init-js ends here
