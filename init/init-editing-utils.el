
;; ---------------------------------------- Whole Line Or Region Mode

(require-package 'whole-line-or-region)

(whole-line-or-region-mode t)

(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

;; ---------------------------------------- Guide Key

(require-package 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x 5" "C-c ;" "C-c ; f"))
(guide-key-mode 1)
(diminish 'guide-key-mode)


;; ---------------------------------------- Goto Last Change

(require-package 'goto-last-change)
(global-set-key (kbd "C-M-z") 'goto-last-change)


(provide 'init-editing-utils)
