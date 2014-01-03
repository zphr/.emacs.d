
;; ---------------------------------------- Imenu

(add-hook 'imenu-after-jump-hook (lambda ()
                                   (recenter-top-bottom)))


(provide 'init-imenu)
