
;; ---------------------------------------- EVIL

(use-package evil
  :ensure t
  :config (progn
	    (evil-mode 1)

	    (setcdr evil-insert-state-map nil)
	    (define-key evil-insert-state-map [escape] 'evil-normal-state)

	    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
	    (define-key evil-insert-state-map (kbd "S-SPC") 'evil-normal-state)
	    (define-key evil-normal-state-map (kbd "S-SPC") 'save-buffer)
	    (define-key evil-normal-state-map (kbd "M-u") 'save-some-buffers)

	    (define-key evil-normal-state-map (kbd "C-r") 'isearch-backward)))


(provide 'init-evil)
