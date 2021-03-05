
;;; ---------------------------------------- Prescient

(use-package prescient
  :ensure t)


;;; ---------------------------------------- Selectrum

(use-package selectrum-prescient
  :ensure t)


;;; ---------------------------------------- Selectrum

(use-package selectrum
  :ensure t
  :init
  (selectrum-mode +1)
  (selectrum-prescient-mode +1))


;;; ---------------------------------------- Consult

(use-package consult
  :ensure t
  :bind (("C-8" . consult-buffer))
  :defer t)


;;; ---------------------------------------- Company Prescient

(use-package company-prescient
  :ensure t
  :bind (("C-s" . consult-line)
         ("C-r" . consult-line)
         ("C-4" . consult-ripgrep)
         ("C-9" . consult-find))
  :init
  (company-prescient-mode +1))


;;; ---------------------------------------- Marginalia

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode)

  ;; When using Selectrum, ensure that Selectrum is refreshed when cycling annotations.
  (advice-add #'marginalia-cycle :after
              (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))

  ;; Prefer richer, more heavy, annotations over the lighter default variant.
  ;; E.g. M-x will show the documentation string additional to the keybinding.
  ;; By default only the keybinding is shown as annotation.
  ;; Note that there is the command `marginalia-cycle' to
  ;; switch between the annotators.
  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
)

;;; ---------------------------------------- Embark

(use-package embark
  :ensure t
  :bind
  ("C-S-a" . embark-act))              ; pick some comfortable binding


;;; ---------------------------------------- Embark Consult

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t                ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))


(provide 'init-selectrum)
;;; init-selectrum.el ends here
