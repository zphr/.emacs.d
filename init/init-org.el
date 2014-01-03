;;; ---------------------------------------- Org Mode

(require 'org)
(require 'org-latex)

(setq org-directory "e:/Rettungsboot/Dokumente/TODO")

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
(setq org-hide-emphasis-markers t)


;;; ---------------------------------------- Org Bibtex

(require 'bibtex)
(require 'org-bibtex)

;; ;;; ---------------------------------------- Capture

;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (define-key global-map "\C-cc" 'org-capture)

;; (defun org-capture-find-changelog-entry ()
;;   (let ((time-string (format-time-string " <%Y-%m-%d %a>"))
;;         (project-headline (with-current-buffer
;;                               (buffer-name (org-capture-get :original-buffer))
;;                             (eproject-name)))
;;         (file-headline (concat "** "(file-name-sans-extension
;;                                      (buffer-name (org-capture-get :original-buffer))))))
;;     (beginning-of-buffer)
;;     (if (null (re-search-forward (concat "^\* " project-headline time-string"$") nil t))
;;         (progn
;;           (end-of-buffer)
;;           (insert "\n* " project-headline time-string"\n")))
;;     (if (re-search-forward file-headline nil t)
;;         (org-end-of-subtree t)
;;       (progn
;;         (org-end-of-subtree t)
;;         (insert "\n" file-headline "\n")
;;         (org-up-heading-safe)
;;         (org-sort-entries nil ?a)
;;         (re-search-forward file-headline nil t)))))

;; (setq org-capture-templates
;;       '(("l" "Changelog FSemester" plain
;;          (file+function (concat org-directory "/changelog.org")
;;                         org-capture-find-changelog-entry)
;;          "*** %T %? %i %^g")
;;         ("L" "Changelog FSemester" plain
;;          (file+function (concat org-directory "/changelog.org")
;;                         org-capture-find-changelog-entry)
;;          "*** %^T %? %i %^g")))

;;; ---------------------------------------- Export

(add-to-list 'org-export-backends 'confluence)


(provide 'init-org)
