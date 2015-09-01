
;;; Code:

;;; ---------------------------------------- Telephone-Line

(use-package telephone-line
  :ensure t
  :config (progn
	    (setq telephone-line-lhs
		  '((accent . (telephone-line-vc-segment
			       telephone-line-erc-modified-channels-segment
			       telephone-line-process-segment))
		    (nil    . (telephone-line-minor-mode-segment
			       telephone-line-buffer-segment))))

	    (setq telephone-line-rhs
		  '((nil    . (telephone-line-misc-info-segment))
		    (accent . (telephone-line-major-mode-segment))
		    (evil   . (telephone-line-airline-position-segment))))

	    (telephone-line-mode t)))

;; ;; ---------------------------------------- Powerline

;; (use-package powerline
;;   :ensure t
;;   :config (powerline-default-theme))


(provide 'init-mode-line)
;;; init-mode-line ends here
