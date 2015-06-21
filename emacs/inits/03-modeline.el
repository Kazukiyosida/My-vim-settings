;; モードラインの空白を減らす
(setq-default mode-line-format
              '("-"
                mode-line-mule-info
                mode-line-modified
                mode-line-frame-identification
		mode-line-buffer-identification
		" "
                (line-number-mode "L%l ")
                (column-number-mode "C%c ")
                (-3 . "%p")
		vc-mode
                " "
                global-mode-string
                " %[("
                mode-name
                mode-line-process
                minor-mode-alist
                "%n" ")%] "
                (which-func-mode ("" which-func-format " "))
                "")
              )
(setq mode-line-frame-identification " ")
;; モード名を短くする
(setcar (cdr (assq 'abbrev-mode minor-mode-alist)) " Abb")
(setcar (cdr (assq 'undo-tree-mode minor-mode-alist)) " UTr")
(setcar (cdr (assq 'git-gutter-mode minor-mode-alist)) " Gg")
(setcar (cdr (assq 'flymake-mode minor-mode-alist)) " Flym")
;; (add-hook 'emacs-lisp-mode-hook '(lambda () (setq mode-name "Elisp")))
