
(use-package god-mode
  :ensure t
  :defer t
  :init (setq original-cursor-color (face-foreground 'cursor))
  :bind (("<return>" . god-mode))
  :config
  (god-mode-all)
  
  (defun my-update-cursor ()
    (setq cursor-type (if (or god-local-mode buffer-read-only)
                          'box
                        'bar)))

  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)

  (defun god-mode-start ()
    (local-set-key (kbd "S-SPC") 'save-buffer)
    (set-cursor-color (face-foreground 'error))
    (blink-cursor-mode -1))

  (defun god-mode-end ()
    (local-set-key (kbd "S-SPC") 'god-local-mode)
    (set-cursor-color original-cursor-color)
    (blink-cursor-mode 1))

  (add-hook 'god-mode-enabled-hook 'god-mode-start)
  (add-hook 'god-mode-disabled-hook 'god-mode-end)

  (define-key god-local-mode-map (kbd "N") 'forward-paragraph)
  (define-key god-local-mode-map (kbd "P") 'backward-paragraph)
  (define-key god-local-mode-map (kbd "i") 'god-local-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)

  (define-key god-local-mode-map (kbd "F") 'forward-word)
  (define-key god-local-mode-map (kbd "V") '(lambda () (interactive) (scroll-down-command)))
  (define-key god-local-mode-map (kbd "B") 'backward-word)

  (define-key god-local-mode-map (kbd "C") 'comment-dwim)
  (define-key god-local-mode-map (kbd "u") 'undo)
  (define-key god-local-mode-map (kbd "O") 'switch-window)

  
  ;; ---------------------------------------- Helm Bindings

  (define-key god-local-mode-map (kbd "h") 'helm-mini)

  (defun helm-swoop-start-with-2 ()
    (interactive)
    (helm-swoop 2))
  (define-key god-local-mode-map (kbd "S") 'helm-swoop-start-with-2)

  (define-key god-local-mode-map (kbd "t") 'helm-etags-select)
  (define-key god-local-mode-map (kbd "I") 'helm-imenu)
  
  ;; ---------------------------------------- Multiple Cursors


  (defadvice mc/mark-next-like-this (before mc/exit-god-mode activate)
    (god-local-mode -1))

  (defadvice mc/mark-previous-like-this (before mc/exit-god-mode2 activate)
    (god-local-mode -1)))


;; ---------------------------------------- Jump Char Bindings

(use-package jump-char
  :ensure t
:defer t
  :if (after-load 'god-mode)
  :config (progn (define-key jump-char-isearch-map (kbd "<return>") 'jump-char-exit)
		 (define-key god-local-mode-map (kbd "f") 'jump-char-forward)
		 (define-key god-local-mode-map (kbd "b") 'jump-char-backward)))


(provide 'init-god-mode)
