;; YaTeX
(require 'yatex)
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq tex-command "platex")
(setq dvi2-command "xdvi")
(setq bibtex-command "pbibtex")
(setq dviprint-command-format "dvipdfmx")
;; 自動で改行しない
(add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1)))
(add-hook 'yatex-mode-hook '(lambda () (setq mode name "ytex")))

;; pdf
(require 'autorevert)
(add-hook 'pdf-view-mode-hook 'auto-revert-mode)
(setq auto-revert-interval 1)
