

;; ---------------------------------------- Company

(use-package company
  :ensure t
  :diminish company-mode
  ;; :bind
  ;; ("M-SPC" . company-complete)
  :config
  (global-company-mode t)
  (setq company-clang-executable nil)
  (setq company-auto-complete nil)
  (setq company-idle-delay 0.2)
  (setq company-dabbrev-downcase nil))


;; ---------------------------------------- Auctex Completion

(use-package company-auctex
  :ensure t
  :defer t
  :config (company-auctex-init))


;; ---------------------------------------- Quickhelp

(use-package company-quickhelp
  :ensure t
  :defer t
  :config (company-quickhelp-mode 1))


(provide 'init-company)
