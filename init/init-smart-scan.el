
(require-package 'smartscan)

(after-load 'smartscan
  (global-smartscan-mode t))


(global-set-key (kbd "M-N") 'smartscan-symbol-go-forward)
(global-set-key (kbd "M-P") 'smartscan-symbol-go-backward)

(defadvice smartscan-symbol-go-forward (around smartscan-restrict-to-defun-forward (&optional arg) activate)
  "Restrict smartscan to defun bounds."
  (let* ((start (save-excursion (progn (beginning-of-defun) (point))))
	 (end (save-excursion (progn (end-of-defun) (point)))))
    (save-restriction
      (narrow-to-region start end)
      ad-do-it)))

(defadvice smartscan-symbol-go-backward (around smartscan-restrict-to-defun-backward (&optional arg) activate)
  "Restrict smartscan to defun bounds."
  (let* ((start (save-excursion (progn (beginning-of-defun) (point))))
	 (end (save-excursion (progn (end-of-defun) (point)))))
    (save-restriction
      (narrow-to-region start end)
      ad-do-it)))


(provide 'init-smart-scan)
