
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


;;; ---------------------------------------- Clear Shell Output

(defun eshell-clear-buffer ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook
      '(lambda()
          (local-set-key (kbd "M-k") 'eshell-clear-buffer)))


;;; ---------------------------------------- Nicer Prompt

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (not (file-remote-p pwd))
             (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let* ((git-url (shell-command-to-string "git config --get remote.origin.url"))
           (git-repo (file-name-base (s-trim git-url)))
           (git-output (shell-command-to-string (concat "git rev-parse --abbrev-ref HEAD")))
           (git-branch (s-trim git-output))
           (git-icon  "\xe0a0")
           (git-icon2 (propertize "\xf020" 'face `(:family "octicons"))))
      (concat git-repo " " git-icon2 " " git-branch))))

(defun pwd-replace-home (pwd)
  "Replace home in PWD with tilde (~) character."
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun pwd-shorten-dirs (pwd)
  "Shorten all directory names in PWD except the last two."
  (let ((p-lst (split-string pwd "/")))
    (if (> (length p-lst) 2)
        (concat
         (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                               (substring elm 0 1)))
                    (butlast p-lst 2)
                    "/")
         "/"
         (mapconcat (lambda (elm) elm)
                    (last p-lst 2)
                    "/"))
      pwd)))  ;; Otherwise, we just return the PWD

(defun split-directory-prompt (directory)
  (if (string-match-p ".*/.*" directory)
      (list (file-name-directory directory) (file-name-base directory))
    (list "" directory)))

(defun eshell/eshell-local-prompt-function ()
  "A prompt for eshell that works locally (in that is assumes
that it could run certain commands) in order to make a prettier,
more-helpful local prompt."
  (interactive)
  (let* ((pwd        (eshell/pwd))
         (directory (split-directory-prompt
                     (pwd-shorten-dirs
                      (pwd-replace-home pwd))))
         (parent (car directory))
         (name   (cadr directory))
         (branch (curr-dir-git-branch-string pwd))

         (dark-env (eq 'dark (frame-parameter nil 'background-mode)))
         (for-bars                 `(:weight bold))
         (for-parent  `(:inherit 'eshell-prompt))
         (for-dir     `(:inherit 'eshell-ls-directory))
         (for-git `(:inherit 'eshell-ls-executable)))

    (concat
     (propertize "⏩ "    'face for-parent)
     (propertize parent   'face for-parent)
     (propertize name     'face for-dir)
     (when branch
       (concat (propertize " ── "    'face for-bars)
               (propertize branch   'face for-git)))
     (propertize "\n"     'face for-bars)
     (propertize (if (= (user-uid) 0) " #" " $") 'face `(:weight ultra-bold))
     ;; (propertize " └→" 'face (if (= (user-uid) 0) `(:weight ultra-bold :foreground "red") `(:weight ultra-bold)))
     (propertize " "    'face `(:weight bold)))))

(setq-default eshell-prompt-function #'eshell/eshell-local-prompt-function)


(provide 'init-eshell)
