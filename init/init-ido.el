
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

(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'ido-ubiquitous)
  (ido-ubiquitous-mode t))


;; ---------------------------------------- Smex

;; Use smex to handle M-x
(require-package 'smex)
(global-set-key [remap execute-extended-command] 'smex)


;; ---------------------------------------- Idomenu

(require-package 'idomenu)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)


;; ---------------------------------------- FLX

;; speed up garbage collector 
(setq gc-cons-threshold 20000000)

(require-package 'flx-ido)
(flx-ido-mode t)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)


(provide 'init-ido)
