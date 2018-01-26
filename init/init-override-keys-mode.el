
;;; ---------------------------------------- Override Keys Minor Mode

(defvar override-keys-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-s") 'swiper)
    map)
  "This is the override-keys-mode keymap ensuring the key
combos are useable everywhere!")

(define-minor-mode override-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " override-keys")

(override-keys-mode +1)


(provide 'init-override-keys-mode)
