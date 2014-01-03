
;;; ---------------------------------------- Inferior Blender

(defvar blender-path 'blender'
  "Blender path.")

(require 'ansi-color)
(require 'comint)

(eval-when-compile
  (require 'cl-lib)
  ;; Avoid compiler warnings
  (defvar compilation-error-regexp-alist))

;; (optional ("Error:" (1+ (any " "))))
(defvar blender-shell-compilation-regexp-alist
  `((,(rx line-start (1+ (any " "))  "File \""
          (group (1+ (not (any "\"<")))) ; avoid `<stdin>' &c
          "\", line " (group (1+ digit))) ;
     1 2)                               ; 1 and 2 define the position
                                        ; of the FILE-regex-group and
                                        ; the LINE-regex-group (in
                                        ; that order)
    (,(rx " in file " (group (1+ not-newline)) " on line "
          (group (1+ digit)))
     1 2)
    (,(rx line-start "> " (group (1+ (not (any "(\"<"))))
          "(" (group (1+ digit)) ")" (1+ (not (any "("))) "()")
     1 2)
    (,(rx line-start (group (1+ (not (any ":")))) ":" (group (1+ digit)) line-end)
     1 2)                               ; Blender specific error regexp
    ))

(defun blender-comint-output-filter-function (output)
  "Hook run after content is put into comint buffer.
OUTPUT is a string with the contents of the buffer."
  (ansi-color-filter-apply output))

(define-derived-mode inferior-blender-mode comint-mode "Inferior Blender"
  (set-syntax-table python-mode-syntax-table)
  (setq mode-line-process '(":Blender"))
  (make-local-variable 'comint-output-filter-functions)
  (add-hook 'comint-output-filter-functions
            'blender-comint-output-filter-function)
  (add-hook 'comint-output-filter-functions
            'comint-postoutput-scroll-to-bottom)
  (define-key inferior-blender-mode-map (kbd "<f5>") 'blender-make-comint)
  (set (make-local-variable 'compilation-error-regexp-alist)
       blender-shell-compilation-regexp-alist)
  (compilation-shell-minor-mode 1))

(defun blender-make-comint ()
***REMOVED***
  (save-excursion
    (let* ((buffer-name "*blender*"))
      (if (comint-check-proc buffer-name)
          (progn                 ; kill process and buffer for restart
            (pop-to-buffer buffer-name)
            (kill-buffer buffer-name)
            (delete-window)))
      (let ((buffer))
        (setq buffer (apply 'make-comint "blender" (list blender-path)))
        (with-current-buffer buffer
          (inferior-blender-mode)
          (pop-to-buffer buffer-name))))))

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "<f5>") 'blender-make-comint)))

(provide 'blender-inferior-mode)
