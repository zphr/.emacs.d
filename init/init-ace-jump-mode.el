
;; ---------------------------------------- Ace Jump Mode

(require-package 'ace-jump-mode)

(setq ace-jump-mode-case-fold t)
(setq ace-jump-mode-enable-mark-sync t)

(setq ace-jump-mode-move-keys
      '(?j ?k ?l ?f ?d ?s ?a ?ö ?ä ?# ?u ?i ?o ?p ?q ?w ?e ?r ?t ?z ?n ?m ?. ?- ?v ?c ?x ?y ?b))

(require 'cc-mode)

(defun set-up-ace-jump-keys ()
  (local-set-key (kbd "ö") 'ace-jump-word-mode)
  (local-set-key (kbd "ü") 'ace-jump-line-mode))

(add-hook 'prog-mode-hook 'set-up-ace-jump-keys)

(global-set-key (kbd "´") 'ace-jump-word-mode)

(global-set-key (kbd "C-ü") 'ace-jump-word-mode)
(global-set-key (kbd "C-M-ü") 'ace-jump-char-mode)
(global-set-key (kbd "C-S-R") 'ace-jump-word-mode)
(global-set-key (kbd "C-,") 'ace-jump-word-mode)
(global-set-key (kbd "C-.") 'ace-jump-line-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode-pop-mark)


(provide 'init-ace-jump-mode)
