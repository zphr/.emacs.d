
(require 'semantic)

(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

(when (eq system-type 'windows-nt) 
  (when (string= (system-name) "FOOLHOUSE-PC")
    (setq semanticdb-project-roots '("c:/Program Files/MAXON/CINEMA 4D R14/plugins/laubwerk_c4d/"
				     "c:/Program Files/MAXON/CINEMA 4D R14/plugins/laubwerk_edit/"))

    (semantic-add-system-include "C:/Program Files \(x86\)/Microsoft Visual Studio 10.0/VC/include/" 'c++-mode)
    (semantic-add-system-include "c:/Program Files/MAXON/CINEMA 4D R14/resource/_api" 'c++-mode))

  (when (string= (system-name) "GANDALF") ; laubwerk pc
    (setq semanticdb-project-roots '("C:/Program Files/MAXON/CINEMA 4D R14 Student/plugins/laubwerk_c4d"))))

;; (add-to-list 'ac-sources 'ac-source-semantic)

(defun semantic-and-gtags-complete ()
  (interactive)
  (auto-complete '(ac-source-semantic ac-source-gtags)))

(require-package 'function-args)
(require 'function-args)

(defun my-fa-config-default ()
  "Set up default key bindings."
  (define-key c++-mode-map (kbd "C-. C-o") 'moo-complete)
  (define-key c++-mode-map (kbd "C-. C-i") 'fa-show)
  (define-key c++-mode-map (kbd "C-. C-n") (fa-idx-cycle 1))
  (define-key c++-mode-map (kbd "C-. C-h") (fa-idx-cycle -1))
  (define-key c++-mode-map (kbd "C-. C-u") 'fa-abort)
  (define-key c++-mode-map (kbd "C-. C-j") `(lambda()(interactive)
					    (if fa-overlay
						(fa-jump)
					      (,(key-binding (kbd "M-j")))))))

(set-face-attribute 'fa-face-hint nil :foreground 'nil :background 'nil :inherit 'font-lock-function-name-face)
(set-face-attribute 'fa-face-hint-bold nil :foreground 'nil :background 'nil :inherit 'font-lock-constant-face)
(set-face-attribute 'fa-face-type nil :foreground 'nil :background 'nil :inherit 'font-lock-type-face)
(set-face-attribute 'fa-face-type-bold nil :foreground 'nil :background 'nil :inherit 'font-lock-type-face :bold t)
(set-face-attribute 'fa-face-semi nil :foreground 'nil :background 'nil :inherit 'font-lock-comment-face)

(defun my-semantic-c++-hook ()
  (semantic-mode t)
  (local-set-key (kbd "C-M-i") 'semantic-and-gtags-complete)

  (my-fa-config-default))

(add-hook 'c++-mode-hook 'my-semantic-c++-hook)


(provide 'init-semantic)
