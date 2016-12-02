
;;; ---------------------------------------- SmartParens

(use-package smartparens
  :ensure t
  :bind
  ("M-C-f" . sp-forward-sexp)
  ("M-C-b" . sp-backward-sexp)
  ("M-C-u" . sp-backward-up-sexp)
  ("M-C-d" . sp-down-sexp)
  ("M-C-S-a" . sp-beginning-of-sexp)
  ("M-C-S-e" . sp-end-of-sexp)
  ("M-C-n" . sp-next-sexp)
  ("M-C-p" . sp-previous-sexp)
  ("M-F" . sp-forward-symbol)
  ("M-B" . sp-backward-symbol)
  ("C-M-t" . sp-transpose-sexp)
  ("C-M-k" . sp-kill-sexp)
  ("C-k"   . sp-kill-hybrid-sexp)
  ("C-M-w" . sp-copy-sexp)
  :config
  (electric-pair-mode -1)
  (require 'smartparens-config)
  (add-hook 'web-mode-hook #'smartparens-strict-mode)
  (add-hook 'js2-mode-hook #'smartparens-strict-mode)
  (add-hook 'js-mode-hook #'smartparens-strict-mode)
  (add-hook 'rjsx-mode-hook #'smartparens-strict-mode))

(provide 'init-smartparens)
;;; init-smartparens ends here
