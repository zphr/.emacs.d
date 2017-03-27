
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
  (setq powerline-default-separator 'butt)
  (setq spaceline-window-numbers-unicode t)
  (setq spaceline-workspace-numbers-unicode t)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-emacs-theme))


(provide 'init-mode-line)
;;; init-mode-line ends here
