
;;; ---------------------------------------- Auctex

(require-package 'auctex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(setq TeX-display-help 'expert)
(setq TeX-source-correlate-method 'synctex)
(setq-default TeX-master nil)

(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)

(defun call-latex (name)
  "Execute `TeX-command-list' NAME from a menu."
  (interactive "P")
  (save-buffer)
  (let ((TeX-command-force name))
    (funcall TeX-command-current)))

(defadvice TeX-TeX-sentinel-check(after open-log-on-error (process name) activate)
  "Open the TeX-Log if errors occured."
  (if (plist-get TeX-error-report-switches (intern (TeX-master-file)))
      (progn
        (font-lock-mode 1)
        (compilation-minor-mode)
        (compilation-parse-errors (point-min) (point-max))
        (first-error))
    (if (get-buffer-window (TeX-active-buffer))
        (delete-window (get-buffer-window (TeX-active-buffer))))))

;;nomenclature for latex
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls"
                  (lambda (name command file)
                    (TeX-run-compile name command file)
                    (TeX-process-set-variable file 'TeX-command-next TeX-command-default))
                  nil t :help "Create nomenclature file")))

;; (LaTeX-command-style (quote (("" "%(PDF)%(latex) %S%(PDFout) -file-line-error"))))
;; (setq LaTeX-command "latex -shell-escape -file-line-error")

(setq TeX-engine-alist 
      '((luatex "LuaTeX" 
		"luatex --file-line-error --shell-escape" 
		"lualatex --jobname=%s --file-line-error --shell-escape "
		"luatex")))

(setq TeX-engine 'luatex)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (flyspell-mode 0)
                             (turn-on-reftex)
                             (setq abbrev-mode 0)
                             (local-set-key (kbd "C-c C-.") 'LaTeX-mark-environment)
                             (local-set-key (kbd "C-<return>") 'TeX-view)
			     (local-set-key (kbd "<f5>") (lambda ()
                                                           (interactive)
                                                           (call-latex "LaTeX")))

                             (local-set-key (kbd "<f6>") (lambda ()
                                                           (interactive)
                                                           (call-latex "BiTbeX")))))

(defadvice TeX-master-file-ask (around set-master-with-dir-local activate)
  (let ((master (if (stringp TeX-master)
                    (concat TeX-master ".tex")
                  (file-name-nondirectory (buffer-file-name)))))
    (save-excursion
      ad-do-it)
    (with-current-buffer (find-file-noselect (concat (file-name-directory master) ".dir-locals.el"))
      (erase-buffer)
      (insert (concat "((latex-mode . ((eval . (setq TeX-master
                              (let ((master-name \"" master  "\" ))
                                (if (locate-file master-name \"./\")
                                    master-name
                                  (concat (locate-dominating-file buffer-file-name master-name) master-name))))))))"))
      (save-buffer))))



(setq TeX-source-correlate-mode t)
(setq TeX-view-program-list (quote (("Sumatra PDF" ("SumatraPDF.exe -reuse-instance" (mode-io-correlate " -forward-search %b %n") " %o")))))
(setq TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "Sumatra PDF") (output-html "start"))))

(provide 'init-latex)
