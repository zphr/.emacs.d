

;; ---------------------------------------- Company

(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :bind
  ("M-/" . company-complete)
  :config
  (global-company-mode t)
  (setq company-clang-executable nil)
  (setq company-auto-complete nil)
  (setq company-idle-delay 0.5)
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
  :config (company-quickhelp-mode))


;;; ---------------------------------------- Company Prescient

(use-package company-prescient
  :ensure t
  :config
  (setq company-prescient-mode t))


(provide 'init-company)
