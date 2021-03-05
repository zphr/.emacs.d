
;;; ---------------------------------------- Open link in running Firefox

(defun my-browse-url-firefox (url &optional new-window)
  "Small change to the original browse-url-firefox by calling
start-process-shell-command instead of start-process. This way a
running firefox instance is reused!"
  (interactive (browse-url-interactive-arg "URL: "))
  (message url)
  (setq url (browse-url-encode-url url))
  (let* ((process-environment (browse-url-process-environment)))
    (apply 'start-process-shell-command
           (concat "firefox " url) nil
           browse-url-firefox-program
           (append
            '("-P default-release")
            (if (browse-url-maybe-new-window new-window)
		(if browse-url-firefox-new-window-is-tab
		    '("-new-tab")
		  '("-new-window")))
            (list url)))))

(setq browse-url-browser-function 'my-browse-url-firefox)


(provide 'init-browsing)
