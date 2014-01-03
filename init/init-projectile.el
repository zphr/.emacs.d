
;; ---------------------------------------- Projectile

(require-package 'projectile)
(require 'projectile)

(projectile-global-mode)

(setq projectile-completion-system 'ido)

(setq projectile-tags-command "ctags -Re --exclude=.git")

(defun projectile-regenerate-tags ()
  "Regenerate the project's etags."
***REMOVED***
  (let* ((project-root (projectile-project-root))
         (tags-exclude (projectile-tags-exclude-patterns))
         (default-directory project-root))
    (shell-command (format projectile-tags-command tags-exclude))
    (visit-tags-table project-root)))

(add-hook 'c++-mode-hook 'projectile-on)


(provide 'init-projectile)
