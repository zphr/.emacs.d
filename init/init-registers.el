
(set-register ?~ '(file . "~/.emacs.d/"))
(set-register ?c '(file . "~/.emacs.d/init.el"))
(set-register ?s '(file . "~/.emacs.d/init/init-shortcuts.el"))
(set-register ?e '(file . "~/.emacs.d/init/init-elpa.el"))

(when (eq system-type 'windows-nt) 
  (set-register ?d '(file . "~/../../Desktop/"))
  (set-register ?l '(file . "~/../../Downloads/"))
  (set-register ?t '(file . "~/../../Desktop/TODO.org"))

  (when (string= (system-name) "FOOLHOUSE-PC")
    (set-register ?6 '(file . "e:/Rettungsboot/Studium/6Semester/"))
    (set-register ?1 '(file . "e:/Rettungsboot/Studium/1MSemester/"))
    (set-register ?2 '(file . "e:/Rettungsboot/Studium/2MSemester/"))
    (set-register ?3 '(file . "e:/Rettungsboot/Studium/3MSemester/"))
    ;; (set-register ?4 '(file . "e:/Rettungsboot/Studium/4MSemester/"))
    (set-register ?r '(file . "e:/Rettungsboot/"))
    (set-register ?a '(file . "e:/Rettungsboot/Arbeit/TU/")))

  (when (string= (system-name) "GANDALF") ; laubwerk pc
    (set-register ?C '(file . "C:/Program Files/MAXON/CINEMA 4D R14 Student"))
    (set-register ?p '(file . "C:/Program Files/MAXON/CINEMA 4D R14 Student/plugins"))
    (set-register ?m '(file . "C:/Program Files/MAXON/CINEMA 4D R14 Student/plugins/laubwerk_c4d"))))

(when (eq system-type 'darwin) 
  (set-register ?d '(file . "~/Desktop/"))
  (set-register ?l '(file . "~/Downloads/"))
  (set-register ?t '(file . "~/Documents/TODO.org"))
  (set-register ?r '(file . "~/.emacs.d/init-registers.el")))

(provide 'init-registers)
