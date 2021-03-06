

;;; ---------------------------------------- Hydra

(use-package hydra
  :ensure t
  :config
  (defhydra hydra-yank-pop ()
    "yank"
    ("C-y" yank nil)
    ("M-y" yank-pop nil)
    ("n" (yank-pop 1) "next")
    ("p" (yank-pop -1) "prev")
    ("l" consult-yank-pop "list" :color blue :exit t))

  (global-set-key (kbd "M-y") #'hydra-yank-pop/yank-pop)
  (global-set-key (kbd "C-y") #'hydra-yank-pop/yank)

  ;; (defhydra hydra-goto-line (goto-map ""
  ;;                                     :pre (push-mark (point))
  ;;                                     :post (linum-mode -1))
  ;;   "goto-line"
  ;;   ("n" flycheck-next-error "next error")
  ;;   ("p" flycheck-previous-error "previous error")
  ;;   ("g" goto-line "go")
  ;;   ("t" git-timemachine "time-machine" :exit t)
  ;;   ("L" (if (bound-and-true-p linum-mode)
  ;;            (linum-mode -1)
  ;;          (linum-mode 1)) "line nr")
  ;;   ("l" flycheck-list-errors "list errors" :bind nil :exit t)
  ;;   ("m" set-mark-command "mark" :bind nil)
  ;;   ("q" nil "quit"))

  ;; (global-set-key (kbd "M-g") #'hydra-goto-line/body)

            ;;; ---------------------------------------- C#

  (defhydra hydra-omnisharp (;; :pre (push-mark (point))
                             ;; :post (pop-mark)
                             )
    "omnisharp"
    ("r" omnisharp-rename "rename")
    ("R" omnisharp-run-code-action-refactoring "refactor")
    ("o" omnisharp-auto-complete-overrides "complete overrides")
    ("u" omnisharp-fix-usings "fix usings")
    ("f" omnisharp-code-format-entire-file"format" :exit t)
    ("q" nil "quit"))

  (add-hook 'csharp-mode-hook (lambda ()
                                (local-set-key (kbd "C-c C-o") #'hydra-omnisharp/body)))
  
  (defhydra multiple-cursors-hydra (:hint nil)
    "
     ^Up^            ^Down^        ^Miscellaneous^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
	      ("l" mc/edit-lines :exit t)
	      ("a" mc/mark-all-like-this :exit t)
	      ("n" mc/mark-next-like-this)
	      ("N" mc/skip-to-next-like-this)
	      ("M-n" mc/unmark-next-like-this)
	      ("p" mc/mark-previous-like-this)
	      ("P" mc/skip-to-previous-like-this)
	      ("M-p" mc/unmark-previous-like-this)
	      ("q" nil))

  (defun switch-to-unit-test-buffer ()
    (interactive)
    (switch-to-buffer-other-window "*mocha tests*")
    (goto-char (point-max)))

  (defhydra hydra-unit-test (:pre (widen))
    "Unit Test"
    ("f" mocha-test-file "file" :exit t)
    ("p" mocha-test-at-point "at point" :exit t)
    ("P" mocha-test-project "project" :exit t)
    ("b" switch-to-unit-test-buffer "show buffer" :exit t))

  (global-set-key (kbd "C-c t") 'hydra-unit-test/body))


(provide 'init-hydra)
;;; init-hydra ends here
