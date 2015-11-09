;;; init.el --- user init file      -*- no-byte-compile: t -*-


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold 200000000)

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


;; ---------------------------------------- Emacs Server

(require 'server)
(unless (server-running-p)
  (server-start))

;; ---------------------------------------- Misc

(require 'misc)

(setq delete-by-moving-to-trash t)

(global-subword-mode t)

(blink-cursor-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;; ---------------------------------------- Fringe

;;  Links 0px, Rechts 4px
(fringe-mode (cons 4 0))


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
(add-to-list 'load-path "./elpa/dash-20150704.253/")
(add-to-list 'load-path "./elpa/packed-20150614.529/")
(add-to-list 'load-path "./elpa/auto-compile-20150511.1017/")
(require 'auto-compile)
(auto-compile-on-load-mode t)
(auto-compile-on-save-mode t)

(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)


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
(require 'init-helm)
;; (require 'init-god-mode)
(require 'init-chat)
;; (require 'init-semantic)
(require 'init-yasnippet)
(require 'init-python)
(require 'init-hydra)
(require 'init-prodigy)
(require 'init-evil)
(require 'init-mode-line)

;;; init.el ends here
