;;; init.el --- user init file      -*- no-byte-compile: t -*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (setq gc-cons-threshold 200000000)


;; ---------------------------------------- Emacs Exit

(setq confirm-kill-emacs 'y-or-n-p)


;; ---------------------------------------- Use-Package

(add-to-list 'load-path "~/.emacs.d/use-package/")
(require 'use-package)


;; ---------------------------------------- Load Path

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))


;; ---------------------------------------- Remove GUI-Clutter

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-screen t)


;; ---------------------------------------- Truncate Lines

(setq truncate-partial-width-windows nil)
(setq truncate-lines t)


;; ---------------------------------------- Unicode

(prefer-coding-system 'utf-8)
;; (setq buffer-file-coding-system 'utf-8)
;; (setq default-file-name-coding-system 'utf-8)
;; (setq default-keyboard-coding-system 'utf-8)
;; (setq default-process-coding-system '(utf-8 . utf-8))
;; (setq default-sendmail-coding-system 'utf-8)
;; (setq default-terminal-coding-system 'utf-8)

;; ---------------------------------------- Emacs Server

(require 'server)
(server-force-delete)
(server-start)

;; ---------------------------------------- Misc

(require 'misc)

(setq delete-by-moving-to-trash t)

(global-subword-mode t)

(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;; ---------------------------------------- Fringe

;; Rechts 4px, Links 0px
(cond
 ((string= system-name "DESKTOP-VTVHSK3")
  (fringe-mode (cons 16 0)))
 (t
  (fringe-mode (cons 8 0))))


;; ---------------------------------------- Font Settings

(when (eq system-type 'windows-nt) ;; mac specific settings
  (add-to-list 'default-frame-alist
               '(font . "Consolas-11:antialias=natural"))
  (set-face-attribute 'default nil :height 105))

(when (eq system-type 'darwin) ;; mac specific settings
  (set-face-attribute 'default nil :height 130))


;; ---------------------------------------- Repeat

(setq set-mark-command-repeat-pop t)


;; ---------------------------------------- Window Splitting

(setq split-width-threshold 160)
(setq split-height-threshold 80)


;; ---------------------------------------- Region

(setq delete-active-region nil)
 

;;; ---------------------------------------- Revert

(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)


;; ---------------------------------------- Cygwin

(setenv "CYGWIN" "nodosfilewarning")

;; ---------------------------------------- Backup- and TMP-Files

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; ---------------------------------------- Mac Key Settings

(when (eq system-type 'darwin)
  (defvar mac-option-key-is-meta)
  (defvar mac-option-modifier)
  (defvar mac-command-key-is-meta)
  (defvar mac-command-modifier)
  (defvar mac-right-command-modifier)

  (setq mac-option-key-is-meta nil)
  (setq mac-option-modifier 'nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-right-command-modifier 'control))


;; ---------------------------------------- Custom File

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;; ---------------------------------------- Bootstrap Config

(require 'init-path)
(require 'init-registers)
(require 'init-shortcuts)
(require 'init-elpa)
(require 'init-theme)
(require 'init-completion)
(require 'init-abbrev)


;; ---------------------------------------- Auto-Compile 

(setq load-prefer-newer t)
(add-to-list 'load-path "~/.emacs.d/elpa/dash-20160820.501/")
(add-to-list 'load-path "~/.emacs.d/elpa/packed-20160523.600/")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-compile-20160711.1012/")
(require 'auto-compile)
(auto-compile-on-load-mode t)
(auto-compile-on-save-mode t)

(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)


;; ---------------------------------------- Indentation

(setq-default indent-tabs-mode nil)

;; ---------------------------------------- Modes and Package Config

(use-package diminish
  :ensure t)
(use-package scratch
  :ensure t)
(use-package idle-highlight-mode
  :ensure t)

(require 'init-misc)
(require 'init-isearch)
(require 'init-sessions)
(require 'init-buffer-window-frame)
(require 'init-killring)
(require 'init-imenu)
(require 'init-eshell)
(require 'init-ido)
(require 'init-recentf)
(require 'init-dired)
(require 'init-org)
(require 'init-magit)
(require 'init-projectile)
(require 'init-editing-utils)
(require 'init-cc-mode)
(require 'init-elisp)
(require 'init-latex)
(require 'init-multiple-cursors)
(require 'init-navigation)
(require 'init-smart-scan)
(require 'init-company)
;; (require 'init-helm)
;; (require 'init-god-mode)
;; (require 'init-chat)
;; (require 'init-semantic)
(require 'init-yasnippet)
(require 'init-python)
(require 'init-hydra)
(require 'init-prodigy)
;; (require 'init-evil)
(require 'init-mode-line)
;; (require 'init-haxe)
(require 'init-js)
(require 'init-smartparens)
(require 'init-flycheck)
(require 'init-counsel)

;;; init.el ends here
