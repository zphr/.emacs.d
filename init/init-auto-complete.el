
;;---------------------------------------- Auto Complete

(require-package 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)

(ac-config-default)
;;; use auto complete standard bindings
(setq ac-use-menu-map t)

(require-package 'fuzzy)
(setq ac-use-fuzzy t)

(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)

(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-filename
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode
                log-edit-mode org-mode text-mode haml-mode
                git-commit-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode
                sql-interactive-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))


;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)


(provide 'init-auto-complete)
