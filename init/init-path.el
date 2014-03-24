;; ---------------------------------------- Windows Path

(when (eq system-type 'windows-nt) ;; mac specific settings
  (setenv "PATH"
          (concat
           "~/.emacs.d/" ";"
	   "C:/Program Files \(x86\)/Git/bin/" ";"
           "C:/Python27/" ";"
           ;; "C:/Python26/" ";"
           "c:/Emacs/bin/" ";"
           "C:/Program\ Files\ \(x86\)/Bazaar/" ";"
           "C:/Program Files/SlikSvn/bin" ";"
           "c:/gnuwin32/bin/" ";"
           "c:/gnuwin32/lib/" ";"
           "C:/cygwin64/bin" ";"
           "C:/Program\ Files\ \(x86\)/Inkscape/" ";"
           "C:/Program Files/TortoiseHg" ";"
           "C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 9\.0/Common7/IDE" ";"
           "C:/Program\ Files\ \(x86\)/Git/bin" ";"
           "c:/Program Files/Blender Foundation/Blender/" ";"
           "c:/Users/Christian/Desktop/emacs-24.3/bin/" ";"
           "C:/Users/Christian/AppData/Roaming/.emacs.d/svn/bin/"  ";"
           ;; "c:/Program Files (x86)/LLVM 3.4.svn/bin/" ";"
           "c:/Program Files (x86)/Cppcheck" ";"
	   ;; "c:/Program Files (x86)/LLVM/bin" ";"
           "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE" ";"
           "C:/Users/Christian/Desktop/zeal"
           (getenv "PATH")))

  (setq exec-path '("~/.emacs.d/" 
		    "C:/Program Files (x86)/Git/bin/"
                    ;; "C:/Python32/"
                    "C:/Python27/" 
                    "c:/Emacs/bin/"
                    "c:/gnuwin32/bin/" 
                    "C:/Program Files (x86)/Bazaar/"
                    "C:/Program Files/SlikSvn/bin"
                    "C:/Program Files/TortoiseHg"
                    "C:/cygwin64/bin"
                    "C:/Program Files (x86)/Inkscape/"
                    "c:/Program Files (x86)/Microsoft Visual Studio 9.0/Common7/IDE"
                    "C:/Program Files/TortoiseHg"
		    "C:/Program Files (x86)/CVSNT/"
                    "C:/Program\ Files\ \(x86\)/Git/bin" 
                    "c:/Program Files/Blender Foundation/Blender/"
                    "c:/Users/Christian/Desktop/emacs-24.3/bin/"
                    "C:/Users/Christian/AppData/Roaming/.emacs.d/svn/bin/"
                    ;; "c:/Program Files (x86)/LLVM 3.4.svn/bin/"
		    "c:/Program Files (x86)/Cppcheck"
		    ;; "c:/Program Files (x86)/LLVM/bin";
                    "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE"
                    "C:/Users/Christian/Desktop/zeal"
                    ;; "c:/Users/foolhouse/Desktop/Blender/blender.exe" ";"
                    (getenv "PATH"))))


;; ---------------------------------------- MacOS Path

(when (eq system-type 'darwin)
  (setenv "PATH"
          (concat
           "/Applications/blender.app/Contents/MacOS/" ":"
           "/usr/texbin/" ":"
           (getenv "PATH")))
  (setq exec-path
        '("/bin"
          "/usr/bin"
          "/usr/local/bin"
          "/usr/texbin/"
          "/Applications/blender.app/Contents/MacOS/"
          )))


(provide 'init-path)
