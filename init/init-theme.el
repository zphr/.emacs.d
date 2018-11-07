
;; (use-package nord-theme
;;   :ensure t
;;   :init (load-theme 'nord))

;; (use-package zerodark-theme
;;   :ensure t
;;   :init (load-theme 'zerodark t)
;;   :config
;;   (zerodark-setup-modeline-format))

;; (use-package apropospriate-theme
;;   :ensure t
;;   :init (load-theme 'apropospriate-dark t))

(use-package labburn-theme
  :ensure t
  :init (load-theme 'labburn))

;; (use-package zenburn-theme
;;   :ensure t
;;   :init (load-theme 'zenburn))

;; (require-package 'subatomic-theme)
;; (load-theme 'subatomic)

;; (use-package omtose-phellack-theme
;;   :ensure t
;;   :init (load-theme 'omtose-darker))

;; (require-package 'firebelly-theme)
;; (load-theme 'firebelly)

;; (require-package 'clues-theme)
;; (load-theme 'clues)

;; ;;; ---------------------------------------- Doom Themes

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;;   ;; may have their own settings.
;;   (load-theme 'doom-nord t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)

;;   ;; Enable custom neotree theme
;;   (doom-themes-neotree-config) ; all-the-icons fonts must be installed!

;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))


;; ---------------------------------------- Mode Line

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)


;;; ---------------------------------------- Clean Switch

(defun switch-theme (theme)
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t))


(provide 'init-theme)
