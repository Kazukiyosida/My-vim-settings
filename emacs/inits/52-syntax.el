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

;; c
(require 'c-eldoc)
(setq c-eldoc-includes
      "`pkg-config gtk+-2.0 --cflags` -I./ -I../ -I/usr/include/SDL2")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; vim
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))
(require 'auto-complete)
(add-to-list 'ac-modes 'vimrc-mode)

;; flex
(require 'bison-mode)






