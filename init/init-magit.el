;;; package --- Summary

;;; Commentary:
;;; This configuration file sets up the git functionalities.

;; Code:

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
  :after magit
  :init
  (add-hook 'magit-mode-hook #'turn-on-magit-gh-pulls)
  :defer t
  :config (progn
	    (require 'magit-popup)))


;; ---------------------------------------- Diff Hl

(use-package diff-hl
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-diff-hl-mode)
  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)
  ;; (add-hook 'prog-mode-hook #'diff-hl-flydiff-mode)
  :config
  (if (eq system-type 'gnu/linux)
      (diff-hl-flydiff-mode t))

  (global-diff-hl-mode 1)
  
  (defhydra hydra-diff-hl (:pre (widen))
    "hunk"
    ("M-g" goto-line "goto" :exit t)
    ("k" diff-hl-revert-hunk "revert")
    ("c" diff-hl-diff-goto-hunk "compare hunk")
    ("n" diff-hl-next-hunk "next")
    ("p" diff-hl-previous-hunk "previous")
    ("s" diff-hl-stage-hunks "stage")
    ("g" magit-status "status":exit t))

  (global-set-key (kbd "C-c g") 'hydra-diff-hl/body))


;;; ---------------------------------------- Git Timemachine

(use-package git-timemachine
  :ensure t)

;; ;;; ---------------------------------------- Magithub

;; (use-package magithub
;;   :after magit
;;   :config (magithub-feature-autoinject t))


;;; ---------------------------------------- Git Link

(use-package git-link
  :ensure t
  :defer t)


(provide 'init-magit)
;;; init-magit.el ends here
