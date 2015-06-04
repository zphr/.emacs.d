
(require-package 'zenburn-theme)
(load-theme 'zenburn)

;; (require-package 'subatomic-theme)
;; (load-theme 'subatomic)

;; (require-package 'firebelly-theme)
;; (load-theme 'firebelly)

;; (require-package 'clues-theme)
;; (load-theme 'clues)


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
