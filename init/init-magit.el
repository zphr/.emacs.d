
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
  :ensure t
  :defer t
  :config (global-diff-hl-mode))


(provide 'init-magit)
