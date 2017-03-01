
;;; ---------------------------------------- Prodigy

(use-package prodigy
  :ensure t
  :defer t
  :bind ("C-7" . prodigy)
  :config

  (prodigy-define-tag
    :name 'npmWebPack
    :on-output (lambda (&rest args)
                 (let ((output (plist-get args :output))
                       (service (plist-get args :service)))
                   (cond ((or (s-matches? "^ERROR in" output)
                              (s-matches? "^Errors:" output)
                              (s-matches? "^Warnings:" output))
                          (prodigy-set-status service 'failed))
                         ((s-matches? "^compiled-server.js" output)
                          (prodigy-set-status service 'ready))
                         (t
                          (prodigy-set-status service 'running))))))

  (when (string= system-name "GENIUS-02")
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
      :name "Omnisharp berlin-partner"
      :command "OmniSharp"
      :args '("-s" "berlin-partner.sln" "-p" "2010")
      :cwd "d:/Software/berlin-partner/"
      :tags '(completion)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)

    (prodigy-define-service
      :name "Unity: GeniuisEvil Client"
      :command "unity"
      :args '("-projectPath" "d:/Software/geniusevil-client/")
      :cwd "d:/Software/geniusevil-client/"
      :tags '(unity-project)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t))

  (when (or
         (string= system-name "christian-MS-7693")
         (string= system-name "localhost.localdomain")
         (string= system-name "EXG.local"))
   (prodigy-define-service
     :name "Gamebook Portal Server"
     :command "~/.nvm/versions/node/v6.10.0/bin/npm"
     :args '("run" "start")
     :cwd "~/Software/gamebook-portal/"
     :url "localhost"
     :port 3000
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t)

   (prodigy-define-service
     :name "Gamebook Portal Watcher"
     :command "~/.nvm/versions/node/v6.10.0/bin/npm"
     :args '("run" "webpack")
     :cwd "~/Software/gamebook-portal/"
     :url "localhost"
     :port 3000
     :kill-signal 'sigkill
     :kill-process-buffer-on-stop t
     :tags '(npmWebPack)))


  (when (string= system-name "EVIL-03")
    (prodigy-define-service
      :name "Omnisharp gamebook-sdk"
      :command "OmniSharp"
      :args '("-s" "gamebook-engine.sln" "-p" "2001")
      :cwd "d:/Projects/ExG/geniusevil-sdk/"
      :tags '(completion)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)

    (prodigy-define-service
      :name "Omnisharp geniusevil-client"
      :command "OmniSharp"
      :args '("-s" "geniusevil-client.sln" "-p" "2000")
      :cwd "d:/Projects/ExG/geniusevil-client/"
      :tags '(completion)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)

    (prodigy-define-service
      :name "Omnisharp berlin-partner"
      :command "OmniSharp"
      :args '("-s" "berlin-partner.sln" "-p" "2010")
      :cwd "d:/Projects/ExG/berlin-partner/"
      :tags '(completion)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)))

(provide 'init-prodigy)
;;; init-prodigy.el ends here
