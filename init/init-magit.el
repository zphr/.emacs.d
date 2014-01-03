
;;; ---------------------------------------- Magit

(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;;; ask for password avoid stdout
(setenv "GIT_ASKPASS" "git-gui--askpass")


(provide 'init-magit)
