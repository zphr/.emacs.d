
;; ---------------------------------------- Imenu

(add-hook 'imenu-after-jump-hook (lambda ()
                                   (recenter-top-bottom)))


;; ---------------------------------------- Flimenu

(use-package flimenu
  :ensure t
  :config
  (flimenu-global-mode +1))


;; ---------------------------------------- Imenu-Anywhere

(use-package imenu-anywhere
  :ensure t
  :bind ("C-." . imenu-anywhere))



(provide 'init-imenu)
