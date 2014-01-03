
(require-package 'god-mode)

(god-mode)

(global-set-key (kbd "C-ö") 'god-local-mode)
(global-set-key (kbd "ö") 'god-local-mode)

(define-key god-local-mode-map (kbd ".") 'repeat)

(define-key god-local-mode-map (kbd "F") 'forward-word)
(define-key god-local-mode-map (kbd "B") 'backward-word)


(provide 'init-god-mode)
