

;; ---------------------------------------- Company

(require-package 'company)
(require 'company)

(global-company-mode t)

(setq company-clang-executable nil)
(setq company-auto-complete nil)
(setq company-idle-delay 0.2)

;; ---------------------------------------- Auctex Completion

(require-package 'company-auctex)
(require 'company-auctex)
(company-auctex-init)


(provide 'init-company)
