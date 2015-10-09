
;; ---------------------------------------- Ido

(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
;; disable automatic file search
(setq ido-auto-merge-work-directories-length -1)
 ;; allow ido to open recently used files!
(setq ido-use-virtual-buffers t)

(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
 "Add my keybindings for ido."
 (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
 (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
 (define-key ido-completion-map (kbd "C-a") 'move-beginning-of-line))


;; ---------------------------------------- Ido Ubiquitous

(use-package ido-ubiquitous
    :ensure t
:defer t
    :if (>= emacs-major-version 24)
    :config (ido-ubiquitous-mode t))


;; ---------------------------------------- Smex

;; Use smex to handle M-x
(use-package smex
  :ensure t
:defer t
  :config (global-set-key [remap execute-extended-command] 'smex))


;; ---------------------------------------- Idomenu

(use-package idomenu
  :ensure t
:defer t)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)


;; ---------------------------------------- FLX

(use-package flx-ido
  :ensure t
  :init (setq gc-cons-threshold 20000000) ;; speed up garbage collector 
  :config (progn
	    (flx-ido-mode t)
	    ;; disable ido faces to see flx highlights.
	    (setq ido-use-faces nil)))


(provide 'init-ido)
