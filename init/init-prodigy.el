
;;; ---------------------------------------- Prodigy

(use-package prodigy
  :ensure t
  :defer t
  :bind ("C-7" . prodigy)
  :config (progn
            ;;; EXG Services 
	    (when (string= system-name "BLACKWORTHMOODY")
	      (prodigy-define-service
		:name "Omnisharp gamebook-sdk"
		:command "OmniSharp"
		:args '("-s" "gamebook-engine.sln" "-p" "2001")
		:cwd "d:/Software/gamebook-sdk/"
		:tags '(completion)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t)

	      (prodigy-define-service
		:name "Omnisharp geniusevil-client"
		:command "OmniSharp"
		:args '("-s" "geniusevil-client.sln" "-p" "2000")
		:cwd "d:/Software/geniusevil-client/"
		:tags '(completion)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t)

	      (prodigy-define-service
		:name "Omnisharp gamebook-client"
		:command "OmniSharp"
		:args '("-s" "gamebook-client.sln" "-p" "2030")
		:cwd "d:/Software/gamebook-client/"
		:tags '(completion)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t)

	      (prodigy-define-service
		:name "Gamebook Server"
		:command "npm"
		:args '("start")
		:cwd "d:/Software/gamebook-web/"
		:tags '(gamebook-server)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t)

	      (prodigy-define-service
		:name "Unity: Gamebook Client"
		:command "unity"
		:args '("-projectPath" "d:/Software/gamebook-client/")
		:cwd "d:/Software/gamebook-client/"
		:tags '(unity-project)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t)

	      (prodigy-define-service
		:name "Unity: GeniuisEvil Client"
		:command "unity"
		:args '("-projectPath" "d:/Software/geniusevil-client/")
		:cwd "d:/Software/geniusevil-client/"
		:tags '(unity-project)
		:kill-signal 'sigkill
		:kill-process-buffer-on-stop t))))

(provide 'init-prodigy)
;;; init-prodigy.el ends here
