(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete t)
 '(company-etags-ignore-case t)
 '(custom-safe-themes
   (quote
    ("cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "454dc6f3a1e9e062f34c0f988bcef5d898146edc5df4aa666bf5c30bed2ada2e" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "5ceb2e85215142caad4c2abc1061c0bade80348c4eb323934a909e36f864d5bc" "c2cfe2f1440d9ef4bfd3ef4cf15bfe35ff40e6d431264b1e24af64f145cffb11" "cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" "769bb56fb9fd7e73459dcdbbfbae1f13e734cdde3cf82f06a067439568cdaa95" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "16248150e4336572ff4aa21321015d37c3744a9eb243fbd1e934b594ff9cf394" "b1f685c871220e3008b5e1dec076bc2e24dc4b6c65e64a79bfb2ea5ff7e17978" "7b4537c56c04c23dd18cdf62194d836a3a4c82c749c131920f070ac401d2ad4e" "ed81411169b1b3e3d4cfc39b09d68ea13e0ff7708dc5b9d0bedb319e071968ad" "7a9f392481b6e2fb027ab9d8053ab36c0f23bf5cc1271206982339370d894c74" "4e28c129f2aad3b3c7e815ce5e83cc10aaf027c5b9e5f61eb2f5731ab13400bb" "36d0f600074e9299fb7b6a316161d99faa16a6551ddeda50980ae293e653e7b4" "71e4ba0f45547c189dffed9dc714460e0190ba331ff5f74a3442694b9be91ed8" default)))
 '(global-company-mode t)
 '(helm-external-programs-associations (quote (("svg" . "inkscape.exe"))))
 '(org-agenda-files (quote ("c:/Users/foolhouse/Desktop/TODO.org")))
 '(safe-local-variable-values
   (quote
    ((eval setq TeX-master
	   (let
	       ((master-name "tikz_test.tex"))
	     (if
		 (locate-file master-name "./")
		 master-name
	       (concat
		(locate-dominating-file buffer-file-name master-name)
		master-name))))
     (eval setq TeX-master
	   (let
	       ((master-name "Diss_metzkes.tex"))
	     (if
		 (locate-file master-name "./")
		 master-name
	       (concat
		(locate-dominating-file buffer-file-name master-name)
		master-name))))
     (eval setq TeX-master
	   (let
	       ((master-name "tab_Lebenslauf.tex"))
	     (if
		 (locate-file master-name "./")
		 master-name
	       (concat
		(locate-dominating-file buffer-file-name master-name)
		master-name))))
     (eval setq TeX-master
	   (let
	       ((master-name "tab_Lebenslauf_english.tex"))
	     (if
		 (locate-file master-name "./")
		 master-name
	       (concat
		(locate-dominating-file buffer-file-name master-name)
		master-name))))
     (eval setq TeX-master
	   (let
	       ((master-name "Master_Verteidigung.tex"))
	     (if
		 (locate-file master-name "./")
		 master-name
	       (concat
		(locate-dominating-file buffer-file-name master-name)
		master-name)))))))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
