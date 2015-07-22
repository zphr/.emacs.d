
(use-package graphviz-dot-mode
  :ensure t
:defer t
  :config (progn
	    (defun graphviz-dot-compile ()
	      (interactive)
	      (save-buffer)
	      (compile compile-command)
	      (save-excursion
		(let ((preview-buffer (get-buffer "*preview*"))))
		(if preview-buffer
		    (progn
		      (switch-to-buffer preview-buffer)
		      (revert-buffer nil t t ))
		  (graphviz-dot-preview))))

	    (defun my-graphviz-hook-stuff ()
	      (local-set-key (kbd "<f5>") 'graphviz-dot-compile))

	    (add-hook 'graphviz-dot-mode-hook 'my-graphviz-hook-stuff)))


(provide 'init-graphviz)
