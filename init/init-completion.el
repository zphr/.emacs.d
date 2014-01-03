
;;; ---------------------------------------- Hippie Expand

(global-set-key (kbd "M-SPC") 'hippie-expand)

(global-set-key (kbd "M-S-SPC") (make-hippie-expand-function
                                 '(try-expand-line
                                   try-expand-whole-kill) t))


(provide 'init-completion)
