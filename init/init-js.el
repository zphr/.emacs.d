
;; ;;; ---------------------------------------- Tern

;; (use-package tern
;;   :ensure t
;;   :diminish tern-mode
;;   :init
;;   (add-hook 'js2-mode-hook #'tern-mode)
;;   (add-hook 'web-mode-hook #'tern-mode))


;; ;;; ---------------------------------------- Company Tern

;; (use-package company-tern
;;   :ensure t
;;   :init
;;   (eval-after-load 'company
;;     '(add-to-list 'company-backends #'company-tern)))


;;; ---------------------------------------- JS2 Mode

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  ;; Let flycheck handle parse errors
  (setq-default js2-show-parse-errors nil)
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-strict-trailing-comma-warning nil) ;; jshint does not warn about this now for some reason

  (require 'js2-imenu-extras)
  (js2-imenu-extras-setup)

  (setq js-indent-level 2
        js2-basic-offset 2)

  (eval-after-load 'align
    '(add-to-list 'align-c++-modes 'js2-mode))

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

  (defun setup-defun-movement ()
    (setq-local beginning-of-defun-function 'js2-beginning-of-defun)
    (setq-local end-of-defun-function 'js2-end-of-defun))

  (add-hook 'js2-minor-mode-hook 'setup-defun-movement)

  (js2-mode-hide-warnings-and-errors)
  (setq js2-mode-assume-strict t)

  (setq js2-highlight-level 3))

;;; ---------------------------------------- JS2 Refactor

(use-package js2-refactor
  :ensure t
  :diminish js2-refactor-mode
  :bind (:map js2-refactor-mode-map
              ("M-k" . js2r-kill))
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m"))


;;; ---------------------------------------- JSON Mode

(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :config
  (setq-default json-reformat:indent-width 2)

  (defun json-reformat-sexp ()
    (interactive)
    (json-reformat-region (point) (save-excursion (end-of-sexp) (point))))
  (bind-key (kbd "M-q") 'json-reformat-sexp json-mode-map))


;;; ---------------------------------------- RSJX Mode

(use-package rjsx-mode
  :ensure t
  :diminish rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js[x]?$" . rjsx-mode))

  (with-eval-after-load 'flycheck
    (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
    (flycheck-add-mode 'javascript-eslint 'rjsx-mode))

  (defun rjsx-setup ()
    (auto-fill-mode -1))
  (add-hook 'rjsx-mode-hook 'rjsx-setup))

;;; ---------------------------------------- Web Mode

(use-package web-mode
  :ensure t
  ;; :demand t
  :config
  ;; (add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))
  ;; (setq web-mode-content-types-alist
  ;;       '(("jsx" . "\\.js[x]?\\'")))

  (setq-default
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-enable-auto-quoting nil)

  (defun start-j2-minor-mode-in-web-mode ()
    (if (and (string= web-mode-content-type "jsx") (fboundp 'js2-minor-mode))
        (js2-minor-mode)))
  (add-hook 'web-mode-hook 'start-j2-minor-mode-in-web-mode)

  (with-eval-after-load 'flycheck
    (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
    (flycheck-add-mode 'javascript-eslint 'web-mode)))


;;; ---------------------------------------- Web Beautify

(use-package web-beautify
  :ensure t
  :config
  (with-eval-after-load 'js2-mode
    '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))

  ;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
  (with-eval-after-load 'js
    '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

  (with-eval-after-load 'json-mode
    '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

  (with-eval-after-load 'rjsx-mode
    (define-key rjsx-mode-map (kbd "M-C-q") 'web-beautify-js))

  (with-eval-after-load 'sgml-mode
    '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

  (with-eval-after-load 'web-mode
    '(define-key web-mode-map (kbd "M-C-q") 'web-beautify-js))

  (with-eval-after-load 'css-mode
    '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))


;; ;;; ---------------------------------------- ESlint Fix

;; (use-package eslint-fix
;;   :ensure t
;;   :config
;;   (with-eval-after-load 'web-mode
;;     (bind-key "M-C-q" 'eslint-fix web-mode-map))

;;   ;; (with-eval-after-load 'rjsx-mode
;;   ;;   (bind-key "M-C-q" 'eslint-fix rjsx-mode-map))

;;   ;; (defun add-eslint-fix-to-save-hook ()
;;   ;;   (when (member web-mode-content-type '("js" "jsx"))
;;   ;;     (add-hook 'after-save-hook 'eslint-fix nil t)))

;;   ;; (with-eval-after-load 'web-mode
;;   ;;   '(add-hook 'web-mode-hook 'add-eslint-fix-to-save-hook))
;;   )


;;; ---------------------------------------- ESlintD Fix

(use-package eslintd-fix
  :ensure t
  :diminish eslintd-fix-mode
  :init
  (add-hook 'js2-mode-hook #'eslintd-fix-mode)
  (add-hook 'rjsx-mode-hook #'eslintd-fix-mode)
  (add-hook 'web-mode-hook #'eslintd-fix-mode))


;;; ---------------------------------------- SCSS Mode

(use-package scss-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  :config
  (setq-default css-indent-offset 2))


;; ;;; ---------------------------------------- Flycheck Flow

;; (use-package flycheck-flow
;;   :ensure t)


;;; ---------------------------------------- JS Import

(use-package js-import
  :ensure t
  :bind (:map rjsx-mode-map
              ("C-M-i" . js-import)
              :map web-mode-map
              ("C-M-i" . js-import))
  ;; (:map web-mode-map
  ;;       ("C-M-i" . js-import))
  :config
  (setq-default js-import-quote "'"))


;; ;;; ---------------------------------------- Import JS

;; (use-package import-js
;;   :ensure t
;;   :defer t
;;   :after web-mode)


;;; ---------------------------------------- JS Import

(use-package js-import
  :ensure t
  :after web-mode
  :config
  (with-eval-after-load 'web-mode
    (define-key web-mode-map (kbd "C-M-i") 'js-import)))


;;; ---------------------------------------- Add Node Modules Path

(use-package add-node-modules-path
  :ensure t
  :config
  (eval-after-load 'rjsx-mode
    '(add-hook 'rjsx-mode-hook #'add-node-modules-path)))


;;; ---------------------------------------- Dumb Jump

(use-package dumb-jump
  :ensure t
  :after rjsx-mode
  :bind
  ("M-," . dumb-jump-back)
  :init
  (setq dumb-jump-selector 'ivy)
  :config
  (assq-delete-all 'dumb-jump-mode minor-mode-map-alist)
  (defun my-dumb-jump-go (&optional arg)
    (interactive "P")
    (if arg
        (dumb-jump-go-other-window)
      (dumb-jump-go)))

  (global-set-key (kbd "M-.") 'my-dumb-jump-go)
  (define-key rjsx-mode-map (kbd "M-.") 'my-dumb-jump-go)
  (define-key rjsx-mode-map (kbd "M-,") 'dumb-jump-back)

  (dumb-jump-mode t))


;;; ---------------------------------------- JS Doc

(use-package js-doc
  :ensure t
  :config
  (with-eval-after-load 'rjsx-mode
    (define-key rjsx-mode-map (kbd "C-c C-i")'js-doc-insert-function-doc)
    (define-key rjsx-mode-map "@" 'js-doc-insert-tag)))


;; ;;; ---------------------------------------- LSP

;; (use-package lsp-javascript-typescript
;;   :ensure t
;;   :init
;;   (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
;;   (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable)
;;   (add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable)
;;   (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable))

;; (use-package lsp-mode
;;   :ensure t
;;   :demand
;;   :config
;;   (lsp-mode t))

;;; ---------------------------------------- Tide

(use-package tide
  :demand t
  :ensure t
  :commands (tide-references tide-rename-symbol tide-nav)
  :bind (:map tide-mode-map
              ("C-M-." . tide-references)
              ("C-M-r" . tide-rename-symbol)
              ("C-M-S-r" . tide-refactor))
  :config
  (defun setup-tide-mode ()
    (interactive)

    (setq tide-tsserver-executable "/Users/christianlenke/.nvm/versions/node/v9.11.1/bin/tsserver")

    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)

    (setq tide-sync-request-timeout 4)

    (tide-hl-identifier-mode -1)
    (setq tide-server-max-response-length 204800)
    (setq tide-default-mode "JSX")
    ;; (setq tide-tsserver-executable "/Users/christianlenke/.nvm/versions/node/v6.9.1/bin/tsserver")
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    (company-mode +1))

  (with-eval-after-load 'flycheck-mode
    (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

  ;; ;; set log level to verbose
  ;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

  (add-hook 'rjsx-mode-hook #'setup-tide-mode)
  (add-hook 'web-mode-hook #'setup-tide-mode)
)


;;; ---------------------------------------- Moch (Jest)
;;; ripped from here https://github.com/scottaj/mocha.el/issues/3
(use-package mocha
  :ensure t
  :commands (mocha-test-project
             mocha-debug-project
             mocha-test-file
             mocha-debug-file
             mocha-test-at-point
             mocha-debug-at-point)
  :config
  ;; Clear up stray ansi escape sequences.
  (defvar jj*--mocha-ansi-escape-sequences
    ;; https://emacs.stackexchange.com/questions/18457/stripping-stray-ansi-escape-sequences-from-eshell
    (rx (or
         "^[\\[[0-9]+[a-z]"
         "�[1A"
         "�[999D")))

  (defun jj*--mocha-compilation-filter ()
    "Filter function for compilation output."
    (ansi-color-apply-on-region compilation-filter-start (point-max))
    (save-excursion
      (goto-char compilation-filter-start)
      (while (re-search-forward jj*--mocha-ansi-escape-sequences nil t)
        (replace-match ""))))

  (advice-add 'mocha-compilation-filter :override 'jj*--mocha-compilation-filter)

  ;; https://github.com/scottaj/mocha.el/issues/3
  (defcustom mocha-jest-command "node_modules/jest/bin/jest.js --colors --watch"
    "The path to the jest command to run."
    :type 'string
    :group 'mocha)

  (defun mocha-generate-command--jest-command (debug &optional filename testname)
    "Generate a command to run the test suite with jest.
     If DEBUG is true, then make this a debug command. If
     FILENAME is specified run just that file otherwise run
     MOCHA-PROJECT-TEST-DIRECTORY. IF TESTNAME is specified run
     jest with a pattern for just that test."
    (let ((target (if testname (concat " --testNamePattern \"" testname "\"") ""))
          (path (if (or filename mocha-project-test-directory)
                    (concat " --testPathPattern \""
                            (if filename filename mocha-project-test-directory)
                            "\"")
                  ""))
          (node-command
           (concat mocha-which-node
                   (if debug (concat " --debug=" mocha-debug-port) ""))))
      (concat node-command " "
              mocha-jest-command
              target
              path)))

  (advice-add 'mocha-generate-command
              :override 'mocha-generate-command--jest-command))


(provide 'init-js)
;;; init-js ends here
