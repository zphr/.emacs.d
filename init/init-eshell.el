
;; ;; ---------------------------------------- Starter Kit Eshell

;; (use-package starter-kit-eshell
;;   :ensure t
;; :defer t)


;; ;; ---------------------------------------- Bash Setup

;; (setq explicit-shell-file-name "c:/Program Files/Git/bin/bash.exe")
;; (setq shell-file-name "bash")
;; (setq explicit-bash-args '("--noediting" "--login" "-i"))
;; (setenv "SHELL" shell-file-name)
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (setq explicit-shell-file-name "C:/Emacs/libexec/emacs/24.5/x86_64-w64-mingw32/cmdproxy.exe")
;; (setq shell-file-name "cmdproxy")
;; (setq explicit-shell-file-name shell-file-name)
;; (setenv "SHELL" shell-file-name)

;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (setq explicit-shell-file-name "c:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
;; (setq shell-file-name "powershell")

;; (setq explicit-shell-file-name "c:/Windows/System32/cmd.exe")
;; (setq shell-file-name "cmd")



(provide 'init-eshell)
