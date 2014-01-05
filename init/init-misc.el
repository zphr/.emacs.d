
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
(add-hook 'prog-mode-hook 'turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'pretty-lambdas)
(add-hook 'prog-mode-hook 'add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)


(defun untabify-buffer ()
***REMOVED***
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
***REMOVED***
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

;; ;; ---------------------------------------- Powerline

;; (require-package 'powerline)
;; (powerline-default-theme)


;; ---------------------------------------- Tramp

(require 'tramp)
(when (eq system-type 'windows-nt)
  (setq tramp-default-method "plink"))


;; ---------------------------------------- Regex Builder

(require 're-builder)
(setq reb-re-syntax 'string)


;; ---------------------------------------- Blender Inferior Mode

(load "~/.emacs.d/blender-inferior-mode.el")
(require 'blender-inferior-mode)

(if (eq system-type 'darwin)
    (setq blender-path "/Applications/blender.app/Contents/MacOS/blender"))


;;; ---------------------------------------- Grep

(setq grep-command "grep -nH -r -e ")

 
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
***REMOVED***
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


(provide 'init-misc)
