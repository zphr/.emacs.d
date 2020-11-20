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


;;; ---------------------------------------- Org Bullet

(use-package org-bullets
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;;; ---------------------------------------- Org Present

(use-package org-present
  :ensure t
  :config
  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-display-inline-images)
              ;; (org-present-hide-cursor)
              ;; (org-present-read-only)
              ))
  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)
              ;; (org-present-show-cursor)
              ;; (org-present-read-write)
              )))


;;; ---------------------------------------- OX GFM
;;; Github Markdown Export

(use-package ox-gfm
  :ensure t
  :after org)



(provide 'init-org)
