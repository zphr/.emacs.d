

;;; ---------------------------------------- CC Mode

(cond ((string= system-name "BLACKWORTHMOODY")
       (setq OpenFileToolValue "12"))
      ((string= system-name "foolhouse")
       (setq OpenFileToolValue "10"))
      (t
       (setq OpenFileToolValue "10")))

(defun open-file-in-visual-studio ()
  "see https://github.com/diimdeep/VisualStudioFileOpenTool"
  (interactive)
  (start-process "VisualStudioOpen" nil "VisualStudioFileOpenTool.exe"
		 OpenFileToolValue (buffer-file-name) (number-to-string (line-number-at-pos))))

;; function decides whether .h file is C or C++ header, sets C++ by
;; default because there's more chance of there being a .h without a
;; .cc than a .h without a .c (ie. for C++ template files)
(defun c-c++-header ()
  "sets either c-mode or c++-mode, whichever is appropriate for
header"
  (interactive)
  (let ((c-file (concat (substring (buffer-file-name) 0 -1) "c")))
    (if (file-exists-p c-file)
        (c-mode)
      (c++-mode))))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c-c++-header))

(c-add-style "laubwerk"
             '(;; "Laubwerk C++ Indentation style"
               (c-basic-offset . 8)     ; Guessed value
               (c-offsets-alist
                (block-close . 0)       ; Guessed value
                (case-label . +)        ; Guessed value
                (defun-block-intro . +) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (defun-open . 0)        ; Guessed value
                (func-decl-cont . 0)    ; Guessed value
                (innamespace . +)       ; Guessed value
                (member-init-intro . 0) ; Guessed value
                (namespace-close . 0)   ; Guessed value
                (statement . 0)         ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (statement-case-intro . +) ; Guessed value
                (substatement-open . 0)    ; Guessed value
                (topmost-intro . 0)        ; Guessed value
                (access-label . -)
                (annotation-top-cont . 0)
                (annotation-var-cont . +)
                (arglist-close . c-lineup-close-paren)
                (arglist-cont c-lineup-gcc-asm-reg 0)
                (arglist-cont-nonempty . c-lineup-arglist)
                (arglist-intro . +)
                (block-open . 0)
                (brace-entry-open . 0)
                 (brace-list-close . 0)
                (brace-list-entry . 0)
                (brace-list-intro . +)
                (brace-list-open . 0)
                (c . c-lineup-C-comments)
                (catch-clause . 0)
                (class-close . 0)
                (class-open . 0)
                (comment-intro . c-lineup-comment)
                (composition-close . 0)
                (composition-open . 0)
                (cpp-define-intro c-lineup-cpp-define +)
                (cpp-macro . -1000)
                (cpp-macro-cont . +)
                (do-while-closure . 0)
                (else-clause . 0)
                (extern-lang-close . 0)
                (extern-lang-open . 0)
                (friend . 0)
                (inclass . +)
                (incomposition . +)
                (inexpr-class . +)
                (inexpr-statement . +)
                (inextern-lang . +)
                (inher-cont . c-lineup-multi-inher)
                (inher-intro . +)
                (inlambda . c-lineup-inexpr-block)
                (inline-close . 0)
                (inline-open . +)
                (inmodule . +)
                (knr-argdecl . 0)
                (knr-argdecl-intro . +)
                (label . 2)
                (lambda-intro-cont . +)
                (member-init-cont . c-lineup-multi-inher)
                (module-close . 0)
                (module-open . 0)
                (namespace-open . 0)
                (objc-method-args-cont . c-lineup-ObjC-method-args)
                (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
                (objc-method-intro .
                                   [0])
                (statement-case-open . 0)
                (statement-cont . +)
                (stream-op . c-lineup-streamop)
                (string . -1000)
                (substatement . +)
                (substatement-label . 2)
                (template-args-cont c-lineup-template-args +)
                (topmost-intro-cont . c-lineup-topmost-intro-cont))))

(c-add-style "experimental-game"
             '((c-basic-offset . 4)
	       (c-offsets-alist
		(defun-open . 0)
		(defun-close . 0)
		(inline-open . 0)
		(func-decl-cont . +)
		(knr-argdecl-intro . +)
		(knr-argdecl . 0)
		(topmost-intro-cont . c-lineup-topmost-intro-cont)
		(annotation-top-cont . 0)
		(annotation-var-cont . +)
		(member-init-intro . +)
		(member-init-cont . c-lineup-multi-inher)
		(inher-intro . +)
		(block-open . 0)
		(brace-list-open . 0)
		(brace-list-close . 0)
		(brace-list-intro . +)
		(brace-list-entry . 0)
		(brace-entry-open . 0)
		(statement-cont . +)
		(statement-case-intro . +)
		(statement-case-open . 0)
		(substatement-label . 2)
		(case-label . +)
		(access-label . -)
		(label . 2)
		(do-while-closure . 0)
		(else-clause . 0)
		(catch-clause . 0)
		(arglist-intro . +)
		(arglist-cont c-lineup-gcc-asm-reg 0)
		(stream-op . c-lineup-streamop)
		(cpp-macro-cont . +)
		(cpp-define-intro c-lineup-cpp-define +)
		(friend . 0)
		(objc-method-intro .
				   [0])
		(objc-method-args-cont . c-lineup-ObjC-method-args)
		(objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
		(extern-lang-open . 0)
		(namespace-open . 0)
		(module-open . 0)
		(composition-open . 0)
		(extern-lang-close . 0)
		(namespace-close . 0)
		(module-close . 0)
		(composition-close . 0)
		(inextern-lang . +)
		(innamespace . +)
		(inmodule . +)
		(incomposition . +)
		(template-args-cont c-lineup-template-args +)
		(inlambda . c-lineup-inexpr-block)
		(lambda-intro-cont . +)
		(inexpr-statement . +)
		(inexpr-class . +)
		(topmost-intro . 0)
		(class-open . 0)
		(inclass . +)
		(defun-block-intro . +)
		(inline-close . 0)
		(statement . 0)
		(substatement . +)
		(substatement-open . 0)
		(statement-block-intro . +)
		(block-close . 0)
		(class-close . 0)
		(c . c-lineup-C-comments)
		(inher-cont . c-lineup-multi-inher)
		(string . -1000)
		(comment-intro . c-lineup-comment)
		(arglist-cont-nonempty . c-lineup-arglist)
		(arglist-close . c-lineup-close-paren)
		(cpp-macro . -1000))))

(setq c-default-style
      '((c++-mode . "ellemtel")
        (csharp-mode . "experimental-game")))

;; see http://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs
(defun c++11-extra-font-locking()
  ;; We could place some regexes into `c-mode-common-hook', but note that their evaluation order
  ;; matters.
  (font-lock-add-keywords
   nil '(;; complete some fundamental keywords
	 ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
	 ;; namespace names and tags - these are rendered as constants by cc-mode
	 ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
	 ;;  new C++11 keywords
	 ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
	 ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
	 ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
	 ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
	 ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
	 ;; hexadecimal numbers
	 ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
	 ;; integer/float/scientific numbers
	 ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
	 ;; c++11 string literals
	 ;;       L"wide string"
	 ;;       L"wide string with UNICODE codepoint: \u2018"
	 ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
	 ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
	 ;;       R"(user-defined literal)"
	 ;;       R"( a "quot'd" string )"
	 ;;       R"delimiter(The String Data" )delimiter"
	 ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
	 ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
	 (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
	 (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

	 ;; user-defined types (rather project-specific)
	 ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
	 ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
	 ))
  )

(defun my-kill-statement ()
  (interactive)
  (let ((start (point)))
    (save-excursion
      (c-end-of-statement)
      (kill-region start (point))
      (delete-blank-lines))))

(add-hook 'c++-mode-hook (lambda ()
                           (subword-mode t)
                           (local-set-key (kbd "C-<return>") 'open-file-in-visual-studio)
			   (local-set-key (kbd "C-c C-k") 'my-kill-statement)
			   (c++11-extra-font-locking)))

;;; ---------------------------------------- C# 

(require-package 'csharp-mode)
(require-package 'omnisharp)

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp--curl-executable-path "c:/Emacs/bin/curl.exe")
(setq omnisharp-server-executable-path "c:/OmniSharpServer/OmniSharp/bin/Release/OmniSharp.exe")
(setq omnisharp-auto-complete-want-documentation nil)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

(eval-after-load 'align
  '(add-to-list 'align-c++-modes 'csharp-mode))

;;; relies heavily on dir-local variables 
(defun start-omnisharp ()
  (interactive)
  (start-process-shell-command "omnisharp-server" nil (concat "OmniSharp -s " solution-file " -p " (int-to-string omnisharp-port))))

(defun look-up-unity-documentation ()
  (interactive)
  (let ((search-string (if (region-active-p)
			   (replace-regexp-in-string "\"" "\\\"" (buffer-substring-no-properties (region-beginning) (region-end)))
			 (symbol-name (symbol-at-point)))))
    (browse-url (concat "http://docs.unity3d.com/ScriptReference/30_search.html?q=" search-string))))

(defun unity-log-symbol-or-region (&optional arg)
  (interactive)
  (let* ((log-string (if (region-active-p)
			(buffer-substring (region-beginning) (region-end))
		      (symbol-name (symbol-at-point))))
	 (debug-string (if arg
			   (concat "Debug.Log(\"" log-string "\");")
			 (concat "Debug.Log(\"" log-string ": \" + " log-string ");"))))
    (message debug-string)
    (save-excursion
      (forward-paragraph)
      (newline)
      (insert debug-string)
      (c-indent-line-or-region)
      (newline))))

(add-hook 'csharp-mode-hook (lambda ()
                           (subword-mode t)
                           (local-set-key (kbd "C-<return>") 'open-file-in-visual-studio)
			   (local-set-key (kbd "C-c C-k") 'my-kill-statement)
			   (local-set-key (kbd "M-.") 'omnisharp-go-to-definition)
			   (local-set-key (kbd "C-M-.") 'omnisharp-helm-find-usages)
			   (local-set-key (kbd "C-c C-i") 'look-up-unity-documentation)
			   (local-set-key (kbd "C-c d") 'unity-log-symbol-or-region)
			   (set-buffer-file-coding-system 'utf-8-dos)
			   (git-gutter+-mode t)
			   (setq indent-tabs-mode nil)))

(defun powerline-color-change ()
  (if (fboundp 'projectile-project-root)
      (cond ((string= (projectile-project-root) "d:/Software/geniusevil-client/")
	     (set-face-background 'powerline-active2 "#ab3737"))
	    ((string= (projectile-project-root) "d:/Software/gamebook-sdk/")
	     (set-face-background 'powerline-active2 "#000000"))
	    (t
	     (set-face-background 'powerline-active2 "#5F5F5F")))))

;; (nil . ((eval . (face-remap-set-base 'powerline-active2 '(:background "#000000")))))

(provide 'init-cc-mode)
