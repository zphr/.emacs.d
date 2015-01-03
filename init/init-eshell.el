
;; ---------------------------------------- Starter Kit Eshell

(require-package 'starter-kit-eshell)


;; ---------------------------------------- Bash Setup

(setq explicit-shell-file-name "c:/Program Files (x86)/Git/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)


(provide 'init-eshell)
