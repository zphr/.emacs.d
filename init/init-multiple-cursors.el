
;; ---------------------------------------- Multiple Cursors

(use-package multiple-cursors
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'multiple-cursors-mode)
  (define-prefix-command 'multiple-cursors-map)
  (bind-key "M-RET" 'multiple-cursors-map)
  (bind-key "M-RET" 'mc/edit-lines multiple-cursors-map)
  (bind-key "da" 'mc/mark-all-like-this-in-defun multiple-cursors-map)
  (bind-key "t" 'mc/mark-sgml-tag-pair multiple-cursors-map)
  (bind-key "dm" 'mc/mark-all-like-this-in-defun multiple-cursors-map)
  (bind-key "dw" 'mc/mark-all-words-like-this-in-defun multiple-cursors-map)
  (bind-key "w" 'mc/mark-all-words-like-this multiple-cursors-map)
  (bind-key "m" 'mc/mark-all-like-this-dwim multiple-cursors-map)
  (bind-key "l" 'mc/edit-lines multiple-cursors-map)
  (bind-key "eb" 'mc/edit-beginnings-of-lines multiple-cursors-map)
  (bind-key "el" 'mc/edit-ends-of-lines multiple-cursors-map)
  (bind-key "n" 'mc/insert-numbers multiple-cursors-map)
  (bind-key "r" 'mc/reverse-regions multiple-cursors-map)
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("M-ö" . mc/mark-next-like-this)
  ("M-ä" . mc/mark-previous-like-this)
  :config (progn

	    (defadvice mc/mark-previous-like-this (before mark-previous-default-mark-sexp
							  (arg) activate)
	      "Use mark-sexp if no region is selected."
	      (unless (region-active-p)
		(progn
		  (mark-sexp))))

	    (defadvice mc/mark-next-like-this (before mark-next-default-mark-sexp
						      (arg) activate)
	      "Use mark-sexp if no region is selected."
	      (unless (region-active-p)
		(progn
		  (mark-sexp))))

	    (defun roughly-same-line-length-p (start-line-end tolerance)
	      (let* ((current-eol (- (line-end-position) (line-beginning-position))))
		(print current-eol)
		(if (<= tolerance (abs (- start-line-end current-eol)))
		    t
		  nil)))

	    (defun char-before-or-after-equal-p (start-prev-char start-next-char)
	      (let* ((prev-char (char-before))
		     (next-char (char-after)))
		(if (or (char-equal prev-char start-prev-char)
			(char-equal next-char start-next-char))
		    t
		  nil)))

	    (defun goto-line-same-column-in-current-block (direction)
	      (let* ((column (current-column))
		     (start-line-end (- (line-end-position) (line-beginning-position)))
		     (start-prev-char (char-before))
		     (start-next-char (char-after))
		     (forward-line-arg (ecase direction
					 (forwards 1)
					 (backwards -1)))
		     (stop-at-line
		      (ecase direction
			(forwards (save-excursion
				    (progn (forward-paragraph)
					   (move-to-column column)
					   (line-number-at-pos))))
			(backwards (save-excursion
				     (progn (forward-paragraph -1)
					    (move-to-column column)
					    (line-number-at-pos)))))))
		(loop do (forward-line forward-line-arg)
		      while (and (not (= (line-number-at-pos) stop-at-line))
				 (<= (skip-syntax-forward " " (line-end-position)) column)
				 (eq (move-to-column column) column)
				 (char-before-or-after-equal-p start-prev-char start-next-char)
				 ;; (roughly-same-line-length-p start-line-end 3)
				 )
		      finally
		      (progn
			(forward-line (* -1 forward-line-arg))
			(move-to-column column)))))

	    (defun mc/mark-column ()
	      (interactive)
	      (let* ((start-pos (point))
		     (start-line (line-number-at-pos))
		     (top (save-excursion (line-number-at-pos
					   (goto-line-same-column-in-current-block 'backwards))))
		     (bottom (save-excursion (line-number-at-pos
					      (goto-line-same-column-in-current-block 'forwards)))))
		(mc/mark-lines (- start-line top) 'backwards)
		(mc/mark-lines (- bottom start-line) 'forwards)
		(mc/maybe-multiple-cursors-mode)))

	    (define-key multiple-cursors-map (kbd "c") 'mc/mark-column)
	    (global-set-key (kbd "C-M-<return>") 'mc/mark-column)))

;; ;; ---------------------------------------- Region Bindings Mode

;; (require-package 'region-bindings-mode)
;; (require 'region-bindings-mode)

;; (region-bindings-mode-enable)
;; (define-key region-bindings-mode-map (kbd "C-M-S-ä") 'mc/edit-ends-of-lines)
;; (define-key region-bindings-mode-map (kbd "C-M-S-n") 'mc/skip-to-next-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-p") 'mc/skip-to-previous-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-m") 'mc/mark-next-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-o") 'mc/mark-previous-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-w") 'mc/mark-next-word-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-u") 'mc/unmark-next-like-this)
;; (define-key region-bindings-mode-map (kbd "C-M-S-z") 'mc/unmark-previous-like-this)


(provide 'init-multiple-cursors)
