
;;; ---------------------------------------- Magit

(use-package magit
  :ensure t
  :defer t
  :bind ("C-x g" . magit-status)
  :config
  ;;; ask for password avoid stdout
  (setenv "GIT_ASKPASS" "git-gui--askpass"))


;; ---------------------------------------- Diff Hl

(use-package diff-hl
  :ensure hydra
  :defer t
  :config (progn
	    (global-diff-hl-mode)
	    
	    (defhydra hydra-diff-hl (:pre (widen))
	      "hunk"
	      ("M-g" goto-line "goto" :exit t)
	      ("v" diff-hl-revert-hunk "revert")
	      ("c" diff-hl-diff-goto-hunk "compare hunk")
	      ("n" diff-hl-next-hunk "next")
	      ("p" diff-hl-previous-hunk "previous")
	      ("s" diff-hl-stage-hunks "stage"))

	    (global-set-key (kbd "C-c g") 'hydra-diff-hl/body)))


(provide 'init-magit)
