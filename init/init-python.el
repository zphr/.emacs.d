
;; ---------------------------------------- Python Mode 

;;; get rid of the sexp movement 
(add-hook 'python-mode-hook
	  (lambda () (setq forward-sexp-function nil)))

	  
(provide 'init-python)
