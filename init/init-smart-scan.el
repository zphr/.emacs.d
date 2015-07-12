
(use-package smartscan
  :ensure t
  :config (progn
	    (global-smartscan-mode t)

	    (defun smartscan-restrict-to-defun-forward ()
	      "Restrict smartscan to defun bounds."
	      (interactive)
	      (let* ((start (save-excursion (progn (beginning-of-defun) (point))))
		     (end (save-excursion (progn (end-of-defun) (point)))))
		(save-restriction
		  (narrow-to-region start end)
		  (smartscan-symbol-go-forward))))

	    (global-set-key (kbd "M-N") 'smartscan-restrict-to-defun-forward)
	    (global-set-key (kbd "M-C-S-n") 'smartscan-symbol-go-forward)

	    (defun smartscan-restrict-to-defun-backward ()
	      "Restrict smartscan to defun bounds."
	      (interactive)
	      (let* ((start (save-excursion (progn (beginning-of-defun) (point))))
		     (end (save-excursion (progn (end-of-defun) (point)))))
		(save-restriction
		  (narrow-to-region start end)
		  (smartscan-symbol-go-backward))))

	    (global-set-key (kbd "M-P") 'smartscan-restrict-to-defun-backward)
	    (global-set-key (kbd "M-C-S-p") 'smartscan-symbol-go-backward)))


(provide 'init-smart-scan)
