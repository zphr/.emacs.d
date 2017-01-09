
;;; Code:

;;; ---------------------------------------- Show Paren

(use-package paren
  :ensure t
  :config
  (show-paren-mode 1))


;; ---------------------------------------- Truncate Long Lines

(setq truncate-lines t)


;; ---------------------------------------- Electric Modes

(electric-pair-mode t)


;; ---------------------------------------- Starter Kit Loot

(defun local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8)
    (hl-line-mode t)))

(defun turn-on-save-place-mode ()
  (require 'saveplace)
  (setq save-place t))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\|DEBUG\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'local-column-number-mode)
(add-hook 'prog-mode-hook 'local-comment-auto-fill)
;; (add-hook 'prog-mode-hook 'turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'pretty-lambdas)
(add-hook 'prog-mode-hook 'add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)


(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(setq visible-bell t
      inhibit-startup-message t
      color-theme-is-global t
      sentence-end-double-space nil
      shift-select-mode nil
      mouse-yank-at-point t
      uniquify-buffer-name-style 'forward
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat user-emacs-directory "oddmuse")
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      diff-switches "-u")


;;; ---------------------------------------- Fancy Narrow
(use-package fancy-narrow
  :ensure t
  :defer t
  :config (fancy-narrow-mode t))


;; ---------------------------------------- Tramp

(use-package tramp
  :defer 10
  :init (progn
	  (when (eq system-type 'windows-nt)
	    (setq tramp-default-method "plink"))))


;; ---------------------------------------- Regex Builder

(use-package re-builder
  :defer t
  :config (progn
	    (setq reb-re-syntax 'string)))


;; ;; ---------------------------------------- Blender Inferior Mode

;; (load "~/.emacs.d/blender-inferior-mode.el")
;; (use-package blender-inferior-mode)

;; (if (eq system-type 'darwin)
;;     (setq blender-path "/Applications/blender.app/Contents/MacOS/blender"))


;;; ---------------------------------------- Grep

(setq grep-command "grep -nH -r -e ")

(use-package wgrep
  :ensure t
  :defer t)

;; ---------------------------------------- Increment Number

(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-match-data
    (let (inc-by field-width answer)
      (setq inc-by (if arg arg 1))
      (skip-chars-backward "0123456789")
      (when (re-search-forward "[0-9]+" nil t)
        (setq field-width (- (match-end 0) (match-beginning 0)))
        (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
        (when (< answer 0)
          (setq answer (+ (expt 10 field-width) answer)))
        (replace-match (format (concat "%0" (int-to-string field-width) "d")
                               answer))))))

(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))

(global-set-key (kbd "C-+") 'my-increment-number-decimal)
(global-set-key (kbd "C--") 'my-decrement-number-decimal)

(defun my-hide ()
  (interactive)
  (if selective-display
      (set-selective-display nil)
    (set-selective-display (+ 1(current-column)))))

(global-set-key (kbd "M-H") 'my-hide)


;; ---------------------------------------- Calendar

;; show the number of the week
(setq calendar-week-start-day 1
      calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'font-lock-function-name-face))

(setq calendar-initial-window-hook
      (function
       (lambda ()
         (setq case-fold-search t)
         (setq truncate-lines t))))


;; ;;; ---------------------------------------- Golden Ratio

;; (use-package golden-ratio
;;   :diminish golden-ratio-mode
;;   :ensure t
;;   :config (progn
;; 	    (setq golden-ratio-auto-scale t)
;; 	    (golden-ratio-mode 1)))


;;; ---------------------------------------- Google This

(use-package google-this
  :diminish google-this-mode
  :ensure t
  :config (google-this-mode t))


;;; ---------------------------------------- Shrink Whitespace

(use-package shrink-whitespace
  :ensure t
  :bind ("C-S-j" . shrink-whitespace))


;;; ---------------------------------------- General Scrolling

(setq next-screen-context-lines 10)


;; ;;; ---------------------------------------- Sublimity

;; (use-package sublimity
;;   :ensure t
;;   :config (progn
;; 	    (require 'sublimity-scroll)

;; 	    (setq sublimity-scroll-weight 10
;; 		  sublimity-scroll-drift-length 5)

;; 	    (sublimity-mode 1)))

;;; --------------------------------------------- Switch to Previous
;;; --------------------------------------------- Buffer

(defun switch-to-previous-buffer (&optional arg)
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers."
  (interactive "P")
  (if arg
      (switch-to-buffer-other-window (other-buffer (current-buffer) 1))
    (switch-to-buffer (other-buffer (current-buffer) 1))))

;; set key binding
(global-set-key [C-tab] 'switch-to-previous-buffer)

;;; ---------------------------------------- Beacon

(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config
  (setq beacon-blink-when-point-moves 10)
  (beacon-mode 1))


;; ;;; ---------------------------------------- Key Chord Mode

;; (use-package key-chord
;;   :ensure t
;;   :config
;;   (key-chord-mode 1))

;; ;;; ---------------------------------------- Indent Guide

;; (use-package indent-guide
;;   :ensure t
;;   :diminish indent-guide-mode
;;   :config
;;   (indent-guide-global-mode))

;; ;;; ---------------------------------------- Eletric Spacing Mode

;; (use-package electric-spacing
;;   :ensure t
;;   :init
;;   (add-hook 'prog-mode-hook #'electric-spacing-mode))


;;; ---------------------------------------- PopUp Switcher

(use-package popup-switcher
  :ensure t
  :config
  (setq psw-in-window-center nil)
  (setq psw-use-flx t))


;;; ---------------------------------------- Zeal At Point

(use-package zeal-at-point
  :ensure t
  :bind ("C-c d" . zeal-at-point))


;;; ---------------------------------------- String Inflection

(use-package string-inflection
  :ensure t
  :bind
  ("C-c C-u" . string-inflection-java-style-cycle))


(provide 'init-misc)
;;; init-misc ends here
