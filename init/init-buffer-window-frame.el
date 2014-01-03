
;; ---------------------------------------- Popwin

(require-package 'popwin)

(require 'popwin)
(popwin-mode 1)

(global-set-key (kbd "<f8>") popwin:keymap)


;; ---------------------------------------- Switch Window

(require-package 'switch-window)

(defadvice switch-window (before switch-frame-if-just-one-window activate)
  "Switch to other frame if only one window exists"
  (if (< (length (window-list)) 2)
      (other-frame 1)))

(global-set-key (kbd "C-S-o") 'switch-window)


;;; ---------------------------------------- IBuffer

(require-package 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("EShell"
                (mode . eshell-mode))
               ("Init"
                (name . "init"))
               ("Pflanzen"
                (filename . "/OSGProjekt1/"))
               ("Praktikum"
                (filename . "/PraktikumsProjekt/"))
               ("Org-Mode" ;; all org-related buffers
                (mode . org-mode))
               ("Twitter"
                (mode . twittering-mode))
               ("Dired"
                (mode . dired-mode))
               ("Info"
                (mode . Info-mode))
               ("Programming"
                (or
                 (mode . c++-mode)
                 (mode . c-mode)
                 (mode . perl-mode)
                 (mode . python-mode)
                 (mode . csharp-mode)
                 (mode . emacs-lisp-mode)))
               ("Version Control"
                (name . "*vc-"))
               ("LaTeX"
                (mode . latex-mode)
                (mode . bibtex-mode))
               ("Image"
                (mode . image-mode))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))


(provide 'init-buffer-window-frame)
