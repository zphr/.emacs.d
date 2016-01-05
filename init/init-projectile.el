
;; ---------------------------------------- Projectile

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (setq projectile-switch-project-action 'projectile-vc))


(provide 'init-projectile)
;;; init-projectile ends here
