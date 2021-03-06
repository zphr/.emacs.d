

;; ---------------------------------------- Elpa

(require 'package)

(setq package-user-dir "~/.emacs.d/elpa/")

;; ---------------------------------------- Sources

(eval-after-load 'package
  '(add-to-list 'package-archives
                '("melpa" . "http://melpa.org/packages/") t))

(eval-after-load 'package
  '(add-to-list 'package-archives
                '("org" . "http://orgmode.org/elpa/") t))

;; ---------------------------------------- Macros

(defmacro after-load (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;; ---------------------------------------- Init

(package-initialize)

;;; ---------------------------------------- Paradox

(use-package paradox
  :ensure t
  :defer t)

(provide 'init-elpa)
