
;;; ---------------------------------------- Yasnippet

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (defun capitalize-first (s)
    (if (> (length s) 0)
        (concat (upcase (substring s 0 1)) (substring s 1))
      nil))
  :config
  (yas-global-mode 1)
  (setq yas-triggers-in-field t))


(provide 'init-yasnippet)
