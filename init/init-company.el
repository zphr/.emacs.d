

;; ---------------------------------------- Company

(use-package company
  :ensure t
  :config (progn
	    (global-company-mode t)
	    (setq company-clang-executable nil)
	    (setq company-auto-complete nil)
	    (setq company-idle-delay 0.2)))


;; ---------------------------------------- Auctex Completion

(use-package company-auctex
  :ensure t
  :config (company-auctex-init))


;; ---------------------------------------- Quickhelp

(use-package company-quickhelp
  :ensure t
  :config (company-quickhelp-mode 1))


(provide 'init-company)
