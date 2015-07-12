
;;; ---------------------------------------- Misc Maps

(global-set-key (kbd "<f6>") 'save-buffer)
(global-set-key (kbd "S-SPC") 'save-buffer)

(global-set-key (kbd "<f5>") (lambda ()
                                  (interactive)
                                  (compile)))

(global-set-key (kbd "C-<f5>") (lambda ()
                                 (interactive)
                                 (message "bla: %s" (compile "make"))))

(global-set-key (kbd "C-x C-r") 'revert-buffer)

(global-set-key (kbd "M-s r") 'query-replace-regexp)

;; (global-set-key (kbd "C-.") 'repeat)

(global-set-key (kbd "C-z") 'undo)

(if (and (= emacs-major-version 24) (> emacs-minor-version 3))
    (global-set-key (kbd "C-S-j" ) 'cycle-spacing)
  (global-set-key (kbd "C-S-j" ) 'just-one-space))

(global-set-key (kbd "M-C-S-j" ) (lambda ()
                                   (interactive)
                                   (just-one-space -1)))

(defun my-find-other-file (&optional arg)
  (interactive "P")
  (let ((use-other-window nil))
    (if arg
        (progn
          (setq use-other-window t)
          (if (one-window-p)
              (progn
                (split-window-sensibly)))
          ))
    (ff-find-other-file use-other-window)))

(global-set-key (kbd "M-O") 'my-find-other-file)

;;; ---------------------------------------- Mark Maps

(global-set-key (kbd "M-o") 'exchange-point-and-mark)

(global-set-key (kbd "C-M-h") 'mark-defun)

;;; ---------------------------------------- Register

(global-set-key (kbd "C-x r a") 'append-to-register)


;;; ---------------------------------------- Killing Maps

;; (global-set-key (kbd "M-<backspace>") (lambda ()
;;                                         (interactive)
;;                                         (kill-line 0)))

(defadvice zap-up-to-char (around zap-up-to-char-case-sensitive
                                  (arg char) activate)
  "Dont ignore case in zap-up-to-char"
  (let ((case-fold-search nil))
    ad-do-it))
(global-set-key (kbd "M-z") 'zap-up-to-char)

;; (defadvice zap-up-back-char (around zap-up-back-char-case-sensitive
;;                                   (arg char) activate)
;;   "Dont ignore case in zap-up-back-char"
;;   (let ((case-fold-search nil)
;;         (arg -1))
;;     ad-do-it))
;; (global-set-key (kbd "M-Z") 'zap-up-back-char)

(global-set-key (kbd "M-K") 'kill-whole-line)

;; (global-set-key (kbd "M-S-<backspace>") 'zap-up-to-char)
(global-set-key (kbd "M-S-<backspace>") 'zap-up-back-char)

(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

;; (global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

;;; unter Umständen in starterkit binding autoloads die gleiche
;;; Kombination löschen!
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

;; (global-set-key (kbd "C-M-S-k") '(lambda ()
;;                                    (interactive)
;;                                    (kill-sexp -1)))

;;; ---------------------------------------- Yank Maps

(global-set-key (kbd "C-M-<backspace>") 'backward-kill-sexp)


;;; ---------------------------------------- Navigation Maps

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-+") 'beginning-of-buffer)
(global-set-key (kbd "M-#") 'end-of-buffer)


;;; ---------------------------------------- Align Maps

(define-prefix-command 'align-map)
(global-set-key (kbd "C-x C-a") 'align-map)
(define-key align-map (kbd "C-a") 'align-current)
(define-key align-map (kbd "C-r") 'align-regexp)

(global-set-key (kbd "C-M-8") 'align-current)
                                                                                         
;;; ---------------------------------------- Indentation Maps

(global-set-key (kbd "C-M-S-q") 'indent-region)

(global-set-key (kbd "M-Q") 'esk-indent-buffer)

(global-set-key (kbd "M-J") 'delete-indentation)


;;; ---------------------------------------- Frame Managing Maps

(global-set-key (kbd "C-S-M-o") 'other-frame)


;;; ---------------------------------------- Window Managing Maps

(global-set-key (kbd "C-x M-+") 'maximize-window)

(global-set-key (kbd "C-0") 'delete-window)
(global-set-key (kbd "C-1") 'delete-other-windows)

(defun custom-split-window-vertically (&optional arg)
  (interactive "P")
  (split-window-vertically)
  (if arg (other-window 1))
  )

(global-set-key (kbd "C-2") 'custom-split-window-vertically)

(defun custom-split-window-horizontally (&optional arg)
  (interactive "P")
  (split-window-horizontally)
  (if arg (other-window 1))
  )

(global-set-key (kbd "C-3") 'custom-split-window-horizontally)

(global-set-key (kbd "C-6") 'save-buffer)

(defun custom-switch-buffer (&optional arg)
  (interactive "P")
  (let ((str) (inhibit-quit t))
    (if arg
        (progn
          (ido-switch-buffer-other-window))
      (ido-switch-buffer))))

(global-set-key (kbd "C-8") 'custom-switch-buffer)

(defun custom-switch-to-ibuffer (&optional arg)
  (interactive "P")
  (when arg
    ;; if the Prefix shortcut was used (car arg) == 4
    ;; if it was used more than once (car arg) > 4
    (if (= (car arg) 4)
        (split-window-horizontally)
      (split-window-vertically))
    (other-window 1)
    )
  (ibuffer)
  )

(global-set-key (kbd "C-9") 'custom-switch-to-ibuffer)


;; ---------------------------------------- Frame

(global-set-key (kbd "C-5") 'other-frame)


;; ---------------------------------------- Starterkit Bindings 

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

;; Turn on the menu bar for exploring new modes
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

;; ;; Font size
;; (define-key global-map (kbd "C-+") 'text-scale-increase)
;; (define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key (kbd "C-x i") 'imenu)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x C-m") 'shell)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'esk-eval-and-replace)

(global-set-key (kbd "C-c v") 'eval-buffer)

;; M-S-6 is awkward
(global-set-key (kbd "C-c q") 'join-line)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; ;; ---------------------------------------- Occur

;; (define-key occur-mode-map (kbd "C-x C-q") 'occur-edit-mode)

(global-set-key (kbd "C-c o") 'occur)

;; ---------------------------------------- Org Mode

(global-set-key "\C-c L" 'org-insert-link-global)
(global-set-key "\C-c o" 'org-open-at-point-global)


;; ---------------------------------------- SEXP Movement

(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp)


;; ;; ---------------------------------------- Ö Map

;; (global-unset-key (kbd "ö"))
;; (define-prefix-command 'ö-map)
;; (global-set-key (kbd "ö") 'ö-map)
;; (define-key ö-map (kbd "s") 'isearch-forward-regexp)
;; (define-key ö-map (kbd "r") 'isearch-backward-regexp)

;; (define-key ö-map (kbd "i") 'helm-imenu)

;; (defadvice isearch-forward-regexp (before my-isearch-repeat-key activate)
;;   (define-key isearch-mode-map (kbd "ö") 'isearch-repeat-forward)
;;   (define-key isearch-mode-map (kbd "ü") 'isearch-repeat-backward))

;; (defadvice isearch-backward-regexp (before my-isearch-repeat-key activate)
;;   (define-key isearch-mode-map (kbd "ö") 'isearch-repeat-backward)
;;   (define-key isearch-mode-map (kbd "ü") 'isearch-repeat-forward))

(provide 'init-shortcuts)

