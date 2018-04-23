
;;; Code:

;; ;;; ---------------------------------------- Telephone-Line

;; (use-package telephone-line
;;   :ensure t
;;   :config (progn
;; 	    (setq telephone-line-lhs
;; 		  '((accent . (telephone-line-buffer-segment
;; 			       telephone-line-erc-modified-channels-segment
;; 			       telephone-line-process-segment))
;; 		    (nil    . (telephone-line-minor-mode-segment
;; 			       telephone-line-vc-segment))))
;; 	    (setq telephone-line-rhs
;; 		  '((nil    . (telephone-line-misc-info-segment))
;; 		    (accent . (telephone-line-major-mode-segment))
;; 		    (evil   . (telephone-line-airline-position-segment))))

;; 	    (telephone-line-mode t)))

;; ;; ---------------------------------------- Powerline

;; (use-package powerline
;;   :ensure t
;;   :config (powerline-default-theme))

;; ;;; ---------------------------------------- All The Icons

;; (use-package all-the-icons
;;   :ensure t)


;;; ---------------------------------------- Spaceline

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (setq spaceline-window-numbers-unicode t)
  (setq spaceline-workspace-numbers-unicode t)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-emacs-theme))


;; ;;; ---------------------------------------- Spaceline All The Icons

;; (use-package spaceline-all-the-icons
;;   :ensure t
;;   :after spaceline
;;   :config
;;   (setq spaceline-all-the-icons-separator-type 'arrow)
;;   (setq spaceline-all-the-icons-slim-render t)

;;   (spaceline-all-the-icons--setup-anzu)
;;   (spaceline-all-the-icons-theme))


;; ;;; ---------------------------------------- Feebleline

;; (use-package feebleline
;;   :ensure t
;;   :demand t
;;   :config
;;   (feebleline-mode +1)
;;   (setq feebleline-mode-line-text
;;         '(("%6s"      ((format "%s,%s" (format-mode-line "%l") (current-column))))
;;           ("%s"       ((if (flycheck-has-current-errors-p)
;;                            (flycheck-mode-line-status-text)
;;                          "")) (face error))
;;           (" : %s"    ((buffer-name)) (face feebleline-bufname-face))
;;           ("%s"       ((if (and (buffer-file-name) (buffer-modified-p)) "*" "" ))
;;            (face feebleline-asterisk-face))
;;           (" | %s"    ((feebleline-previous-buffer-name))
;;            (face feebleline-previous-buffer-face))))
;; )

(provide 'init-mode-line)
;;; init-mode-line ends here
