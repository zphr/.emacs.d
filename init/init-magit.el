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


;; ;;; ---------------------------------------- Magit GH Pulls

;; (use-package magit-gh-pulls
;;   :ensure t
;;   :after magit
;;   :init
;;   (add-hook 'magit-mode-hook #'turn-on-magit-gh-pulls)
;;   :defer t
;;   :config (progn
;; 	    (require 'magit-popup)))


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
    ("l" git-link :exit t)
    ("t" git-timemachine "timemachine" :exit t)
    ("g" magit-status "status" :exit t)
    ("b" magit-blame-addition "blame" :exit t))

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


;;; ---------------------------------------- Smerge

;;; Smerge
(use-package smerge-mode
  :bind ("C-c m" . hydra-smerge/body)
  :config
  (defhydra hydra-smerge (:color pink
                                 :hint nil
                                 :pre (smerge-mode 1)
                                 ;; Disable `smerge-mode' when quitting hydra if
                                 ;; no merge conflicts remain.
                                 :post (smerge-auto-leave))
    "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("q" nil "cancel" :color blue)))

(provide 'init-magit)
;;; init-magit.el ends here
