
;;; ---------------------------------------- Magit

(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

;;; ask for password avoid stdout
(setenv "GIT_ASKPASS" "git-gui--askpass")


;;; ---------------------------------------- Git Gutter

(require-package 'git-gutter+)
(require 'git-gutter+)

(require-package 'git-gutter-fringe+)
(require 'git-gutter-fringe+)

(define-prefix-command 'git-gutter-map)
(global-set-key (kbd "C-c g") 'git-gutter-map)

(defhydra hydra-git-gutter (git-gutter-map "" :pre (widen))
  "hunk"
  ("M-g" goto-line "goto" :exit t)
  ("v" git-gutter+-revert-hunk "revert")
  ("h" git-gutter+-popup-hunk "popup")
  ("n" git-gutter+-next-hunk "next")
  ("p" git-gutter+-previous-hunk "previous")
  ("s" git-gutter+-stage-hunks "stage"))


(provide 'init-magit)
