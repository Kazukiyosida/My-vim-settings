(defun my-c-c++-mode-init ()
  (setq tab-width 8)
)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)
(custom-set-variables
 '(c-basic-offset 8))
;; (custom-set-faces
;;  '(col-highlight ((t (:background "Forestgreen"))))
;;  '(hl-line ((t (:background "Forestgreen")))))

