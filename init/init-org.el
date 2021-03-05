;;; ---------------------------------------- Org Mode

(use-package org-plus-contrib
  :ensure t
  :bind ((:map org-mode-map
	       ("M-C-l". org-metaright)
	       ("M-C-h". org-metaleft)
	       ("M-L". org-shiftright)
	       ("M-H". org-shiftleft)))
  :init
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)

  (setq org-directory "e:/Rettungsboot/Dokumente/TODO")

  (setq org-ellipsis " ▼")

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c C-l") 'org-insert-link)

  (global-set-key (kbd "C-c A") 'org-agenda)

  (setq auto-coding-alist
	(cons '("\\.org\\'" . utf-8) auto-coding-alist))

  (setq org-use-speed-commands t)
  (setq org-completion-use-ido t)
  (setq org-src-fontify-natively t)
  (setq org-hide-emphasis-markers t)

  (require 'ol-git-link)

  (require 'ox-confluence))


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
