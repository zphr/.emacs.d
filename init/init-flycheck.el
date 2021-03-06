
;;; ---------------------------------------- Flycheck

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :bind (:map flycheck-mode-map
              ("C-M-2" . flycheck-next-error)
              ("C-M-1" . flycheck-previous-error))
  :config
  (global-flycheck-mode t)

  (defhydra hydra-flycheck (:pre (widen))
    "errors"
    ("n" flycheck-next-error "next")
    ("p" flycheck-previous-error "previous")
    )

  (global-set-key (kbd "C-c f") 'hydra-flycheck/body)

  (setq flycheck-javascript-eslint-executable "eslint_d"))


;; ;;; ---------------------------------------- Flycheck Pos Tip

;; (use-package flycheck-pos-tip
;;   :if (not (eq system-type 'darwin))
;;   :ensure t
;;   :after flycheck
;;   :config
;;   (flycheck-pos-tip-mode +1))

;;; ---------------------------------------- Flycheck PopUp Tip

(use-package flycheck-popup-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-popup-tip-mode +1))


;; ;;; ---------------------------------------- Flycheck Color Modeline

;; (use-package flycheck-color-mode-line
;;   :ensure t
;;   :after flycheck
;;   :config
;;   (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
;;   ;; (set-face-attribute 'flycheck-color-mode-line-error-face nil :background "firebrick" :foreground "white")
;;   )


(provide 'init-flycheck)
;;; init-flycheck ends here

