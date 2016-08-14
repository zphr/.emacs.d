
;;; ---------------------------------------- Tern

(use-package tern
  :ensure t)


;;; ---------------------------------------- Company Tern

(use-package company-tern
  :ensure t
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends #'company-tern)))


;;; ---------------------------------------- JS2 Mode

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  ;; Let flycheck handle parse errors
  (setq-default js2-show-parse-errors nil)
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

  (require 'js2-imenu-extras)
  (js2-imenu-extras-setup)

  (eval-after-load 'align
    '(add-to-list 'align-c++-modes 'js2-mode))

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

  (setq js2-highlight-level 3))

;;; ---------------------------------------- JS2 Refactor

(use-package js2-refactor
  :ensure t
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m"))


;;; ---------------------------------------- JSON Mode

(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :config
  (defun json-reformat-sexp ()
    (interactive)
    (json-reformat-region (point) (save-excursion (end-of-sexp) (point))))
  (bind-key (kbd "M-q") 'json-reformat-sexp json-mode-map))


;;; ---------------------------------------- Web Mode

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))
  (setq web-mode-content-types-alist
	'(("jsx" . "\\.js[x]?\\'")))

  (with-eval-after-load 'flycheck
      (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
      (flycheck-add-mode 'javascript-eslint 'web-mode)))


(provide 'init-js)
;;; init-js ends here
