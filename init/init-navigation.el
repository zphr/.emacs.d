  
;; ;; ---------------------------------------- Ace Jump Mode

;; (require-package 'ace-jump-mode)

;; (setq ace-jump-mode-case-fold t)
;; (setq ace-jump-mode-enable-mark-sync t)

;; (setq ace-jump-mode-move-keys
;;       '(?j ?k ?l ?f ?d ?s ?a ?ö ?ä ?# ?u ?i ?o ?p ?q ?w ?e ?r ?t ?z ?n ?m ?. ?- ?v ?c ?x ?y ?b ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))

;; (require 'cc-mode)

;; ;; (defun set-up-ace-jump-keys ()
;; ;;   (local-set-key (kbd "ö") 'ace-jump-word-mode)
;; ;;   (local-set-key (kbd "ü") 'ace-jump-line-mode))
;; ;; (add-hook 'prog-mode-hook 'set-up-ace-jump-keys)

;; (global-set-key (kbd "´") 'ace-jump-word-mode)

;; ;; (global-set-key (kbd "C-ö") 'ace-jump-word-mode)
;; ;; (global-set-key (kbd "C-ü") 'ace-jump-line-mode)
;; ;; (global-set-key (kbd "C-M-ü") 'ace-jump-char-mode)
;; ;; (global-set-key (kbd "M-C-R") 'ace-jump-word-mode)
;; (global-set-key (kbd "C-,") 'ace-jump-word-mode)
;; (global-set-key (kbd "C-.") 'ace-jump-line-mode)
;; (global-set-key (kbd "C-;") 'ace-jump-mode-pop-mark)

;; (add-hook 'dired-mode-hook (lambda () (setq-local ace-jump-search-filter
;; 					     (lambda () (get-text-property (point) 'dired-filename)))))

;;; ---------------------------------------- Avy Mode

(use-package avy
  :ensure t
  :bind ("C-ö" . avy-goto-char-timer)
  :config 
  (defun set-up-avy-keys ()
    (local-set-key (kbd "ö") 'avy-goto-char-timer)
    (local-set-key (kbd "ü") 'avy-goto-line))

  (add-hook 'prog-mode-hook 'set-up-avy-keys)

  (setq avy-style 'at-full)
  (setq avy-keys
	'(?j ?k ?l ?f ?d ?s ?a ?ö ?ä ?# ?u ?i ?o ?p ?q ?w ?e ?r ?t ?z ?n ?m ?. ?- ?v ?c ?x ?y ?b ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))
  (setq avy-timeout-seconds 0.4)

  (define-key isearch-mode-map (kbd "ö") 'avy-isearch))


(provide 'init-navigation)
;;; init-navigation.el ends here
