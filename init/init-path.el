;; ---------------------------------------- Windows Path

(when (string= system-name "foolhouse") ;; mac specific settings
  (setenv "PATH"
          (concat
           "~/.emacs.d/" ";"
	   "C:/Program Files \(x86\)/Git/bin/" ";"
	   "c:/Python34/" ";"
           ;; "C:/Python27/" ";"
           ;; "C:/Python26/" ";"
           "c:/Emacs/bin/" ";"
           "C:/Program\ Files\ \(x86\)/Bazaar/" ";"
           "C:/Program Files/SlikSvn/bin" ";"
           "c:/gnuwin32/bin/" ";"
           "c:/gnuwin32/lib/" ";"
           "C:/cygwin64/bin" ";"
           "C:/Program\ Files\ \(x86\)/Inkscape/" ";"
	   "C:/Program\ Files\ \(x86\)/gs/gs9.14/bin/" ";"
           "C:/Program Files/TortoiseHg" ";"
           "C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 9\.0/Common7/IDE" ";"
           "C:/Program\ Files\ \(x86\)/Git/bin" ";"
           "c:/Program Files/Blender Foundation/Blender/" ";"
           "c:/Users/Christian/Desktop/emacs-24.3/bin/" ";"
           "C:/Users/Christian/AppData/Roaming/.emacs.d/svn/bin/"  ";"
           ;; "c:/Program Files (x86)/LLVM 3.4.svn/bin/" ";"
           "c:/Program Files (x86)/Cppcheck" ";"
	   "c:/Program Files (x86)/LLVM/bin" ";"
           "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE" ";"
           "C:/Users/Christian/Desktop/zeal" ";"
	   "c:/Program Files (x86)/MiKTeX 2.9/miktex/bin/" ";"
	   "C:/Program Files (x86)/Graphviz2.38/bin/" ";"
	   "c:/texlive/2014/bin/win32/" ";"
	   "C:/Program Files (x86)/SumatraPDF/" ";"
	   "c:/Program Files/GIMP 2/bin/" ";"
	   "c:/Program Files/ImageMagick-6.7.6-Q16/" ";"
	   "c:/OmniSharpServer/OmniSharp/bin/Release/" ";"
	   "C:/Program Files (x86)/Unity/Editor/Data/Mono/lib/mono/2.0" ";"
           (getenv "PATH")))

  (setq exec-path '("~/.emacs.d/" 
		    "C:/Program Files (x86)/Git/bin/"
                    "c:/Python34/"
                    ;; "C:/Python27/" 
                    "c:/Emacs/bin/"
                    "c:/gnuwin32/bin/" 
                    "C:/Program Files (x86)/Bazaar/"
                    "C:/Program Files/SlikSvn/bin"
                    "C:/Program Files/TortoiseHg"
                    "C:/cygwin64/bin"
                    "C:/Program Files (x86)/Inkscape/"
		    "C:/Program Files (x86)/gs/gs9.14/bin/" 
                    "c:/Program Files (x86)/Microsoft Visual Studio 9.0/Common7/IDE"
                    "C:/Program Files/TortoiseHg"
		    "C:/Program Files (x86)/CVSNT/"
		    "c:/texlive/2014/bin/win32/"
                    "C:/Program/ Files\ \(x86\)/Git/bin" 
                    "c:/Program Files/Blender Foundation/Blender/"
                    "c:/Users/Christian/Desktop/emacs-24.3/bin/"
                    "C:/Users/Christian/AppData/Roaming/.emacs.d/svn/bin/"
                    ;; "c:/Program Files (x86)/LLVM 3.4.svn/bin/"
		    "c:/Program Files (x86)/Cppcheck"
		    "c:/Program Files (x86)/LLVM/bin";
                    "c:/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE"
                    "C:/Users/Christian/Desktop/zeal"
		    "c:/Program Files (x86)/MiKTeX 2.9/miktex/bin/"
		    "C:/Program Files (x86)/Graphviz2.38/bin/"
		    "C:/Program Files (x86)/SumatraPDF/"
                    ;; "c:/Users/foolhouse/Desktop/Blender/blender.exe" ";"
		    "c:/Program Files/GIMP 2/bin/"
		    "c:/Program Files/ImageMagick-6.7.6-Q16/"
		    "c:/OmniSharpServer/OmniSharp/bin/Release/"
		    "C:/Program Files (x86)/Unity/Editor/Data/Mono/lib/mono/2.0"
                    (getenv "PATH"))))

(when (string= system-name "BLACKWORTHMOODY") ;; mac specific settings
  (setenv "PATH"
          (concat
           "~/.emacs.d/" ";"
	   "C:/Program Files \(x86\)/Git/bin/" ";"
           "c:/Emacs/bin/" ";"
	   "C:/Program Files (x86)/Microsoft Visual Studio 11.0/Common7/IDE/" ";"
	   "c:/omnisharp-server/OmniSharp/bin/Release/" ";"
	   "c:/cygwin64/bin/" ";"
	   "c:/Python34/" ";"
	   "C:/texlive/2014/bin/win32/" ";"
	   "c:/Windows/system32/" ";"
	   "C:/Windows/Microsoft.NET/Framework64/v4.0.30319/" ";"
	   "C:/Windows/winsxs/amd64_microsoft-windows-xcopy_31bf3856ad364e35_6.1.7600.16385_none_beea9c500dfd4622/" ";"
	   "c:/Windows/System32/WindowsPowerShell/v1.0/" ";"
	   "C:/Emacs/libexec/emacs/24.5/x86_64-w64-mingw32/" ";"
	   "c:/Python34/Scripts/" ";"
	   "C:/Program Files (x86)/nodejs/" ";"
	   "c:/Users/Christian/AppData/Roaming/npm/" ";"
	   "C:/Program Files/Unity/Editor/" ";"
	   (getenv "PATH")))

  (setq exec-path '("~/.emacs.d/" 
		    "C:/Program Files \(x86\)/Git/bin/" 
		    "c:/Emacs/bin/" 
		    "C:/Program Files (x86)/Microsoft Visual Studio 11.0/Common7/IDE/" 
		    "c:/omnisharp-server/OmniSharp/bin/Release/"
		    "C:/cygwin64/bin/"
		    "c:/Python34/"
		    "C:/texlive/2014/bin/win32/"
		    "c:/Windows/system32/"
		    "C:/Windows/Microsoft.NET/Framework64/v4.0.30319/"
		    "C:/Windows/winsxs/amd64_microsoft-windows-xcopy_31bf3856ad364e35_6.1.7600.16385_none_beea9c500dfd4622/"
		    "c:/Windows/System32/WindowsPowerShell/v1.0/"
		    "C:/Emacs/libexec/emacs/24.5/x86_64-w64-mingw32/"
		    "c:/Python34/Scripts/"
		    "C:/Program Files (x86)/nodejs/"
		    "c:/Users/Christian/AppData/Roaming/npm/"
		    "C:/Program Files/Unity/Editor/"
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
