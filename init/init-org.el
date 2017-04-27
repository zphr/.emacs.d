;;; ---------------------------------------- Org Mode

(use-package org
  :ensure t
  :defer t
  :config
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  (setq org-directory "e:/Rettungsboot/Dokumente/TODO")

  (setq org-ellipsis " ▼")

  (add-hook 'org-mode-hook
	    (lambda ()
	      (define-key org-mode-map (kbd "M-C-l") 'org-metaright)
	      (define-key org-mode-map (kbd "M-C-h") 'org-metaleft)
	      (define-key org-mode-map (kbd "M-L") 'org-shiftright)
	      (define-key org-mode-map (kbd "M-H") 'org-shiftleft)
	      )
	    )

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c C-l") 'org-insert-link)

  (global-set-key (kbd "C-c A") 'org-agenda)

  (setq auto-coding-alist
	(cons '("\\.org\\'" . utf-8) auto-coding-alist))

  (setq org-use-speed-commands t)
  (setq org-completion-use-ido t)
  (setq org-src-fontify-natively t)
  (setq org-hide-emphasis-markers t))

(provide 'init-org)
