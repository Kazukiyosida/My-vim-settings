(setq-default mode-line-format
              '(" "
                mode-line-mule-info
                mode-line-modified
                mode-line-frame-identification
		mode-line-buffer-identification
                " "
                global-mode-string
                " %[("
                mode-name
                mode-line-process
                minor-mode-alist
                "%n" ")%] "
                (which-func-mode ("" which-func-format " "))
                (line-number-mode "L%l ")
                (column-number-mode "C%c ")
                (-3 . "%p")
                "")
              )
(setq mode-line-frame-identification " ")
(setcar (cdr (assq 'abbrev-mode minor-mode-alist)) " Abb")
(setcar (cdr (assq 'git-gutter-mode minor-mode-alist)) " GG")
(add-hook 'emacs-lisp-mode-hook '(lambda () (setq mode-name "Elisp")))
