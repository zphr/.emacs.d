

;;; ---------------------------------------- CC Mode

(defun open-file-in-visual-studio ()
  "see https://github.com/diimdeep/VisualStudioFileOpenTool"
  (interactive)
  (start-process "VisualStudioOpen" nil "VisualStudioFileOpenTool.exe" "10" (buffer-file-name) (number-to-string (line-number-at-pos)))
  ;; (suspend-frame)
  )

(setq c-default-style
      '((c++-mode . "ellemtel")
        (csharp-mode . "ellemtel")))

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

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(setq omnisharp-server-executable-path "c:/OmniSharpServer/OmniSharp/bin/Debug/OmniSharp.exe")

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))


(provide 'init-cc-mode)
