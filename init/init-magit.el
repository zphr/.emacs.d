
;;; ---------------------------------------- Magit

(use-package magit
  :ensure t
  :defer t
  :bind
  ("C-S-g" . magit-status)
  ("C-x g" . magit-status)
  :config (progn
	    ;; ask for password avoid stdout
	    (setenv "GIT_ASKPASS" "git-gui--askpass")))


;;; ---------------------------------------- Magit GH Pulls

(use-package magit-gh-pulls
  :ensure t
  :init
  (add-hook 'magit-mode-hook #'turn-on-magit-gh-pulls)
  :defer t
  :config (progn
	    (require 'magit-popup)))


;; ---------------------------------------- Diff Hl

(use-package diff-hl
  :ensure hydra
  :init
  (add-hook 'after-init-hook #'global-diff-hl-mode)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  :defer t
  :config (progn
	    (global-diff-hl-mode)
	    
	    (defhydra hydra-diff-hl (:pre (widen))
	      "hunk"
	      ("M-g" goto-line "goto" :exit t)
	      ("v" diff-hl-revert-hunk "revert")
	      ("c" diff-hl-diff-goto-hunk "compare hunk")
	      ("j" diff-hl-next-hunk "next")
	      ("k" diff-hl-previous-hunk "previous")
	      ("s" diff-hl-stage-hunks "stage"))

	    (global-set-key (kbd "C-c g") 'hydra-diff-hl/body)))


(provide 'init-magit)
