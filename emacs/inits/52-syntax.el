;; processing
(require 'processing-mode)
(require 'processing-snippets)
(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))
(autoload 'processing-snippets-initialize "processing-snippets" nil nil nil)
(eval-after-load 'yasnippet '(processing-snippets-initialize))
(setq processing-location "~/processing-2.2.1/processing-java")
(setq processing-application-dir "~/processing-2.2.1/")
(setq processing-sketchbook-dir "~/sketchbook/")








