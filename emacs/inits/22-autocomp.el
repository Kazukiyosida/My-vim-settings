;; yasnipet
(require 'yasnippet)
(setq yas-snippet-dirs '(
			 "~/.emacs.d/snippets"
			 "~/.emacs.d/elpa/yasnippet-20150415.244/snippets"
			 ))
(yas-global-mode 1)
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;; yasnippet展開中はflymakeを無効にする

(defvar flymake-is-active-flag nil)

(defadvice yas-expand-snippet
  (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
  (setq flymake-is-active-flag
        (or flymake-is-active-flag
            (assoc-default 'flymake-mode (buffer-local-variables))))
  (when flymake-is-active-flag
    (flymake-mode-off)))

(add-hook 'yas-after-exit-snippet-hook
          '(lambda ()
             (when flymake-is-active-flag
               (flymake-mode-on)
               (setq flymake-is-active-flag nil))))

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-dictionary-directories '(
				  "~/.emacs.d/elpa/auto-complete-20150408.1132/dict"
				  
				  ))
(global-auto-complete-mode t)
;; 10個まで補完候補表示
(setq ac-limit 10)
;; 2文字目から補完開始
(setq ac-auto-start 2)
;; 0.05秒後に補完開始
(setq ac-delay 0.05)
;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 曖昧補完
(setq ac-use-fuzzy t)
;; 補完推測
(setq ac-use-comphist t)
;; 0.05秒後に補完メニュー表示
(setq ac-auto-show-menu 0.05)
;; 同一モードのバッファとファイル名を補完候補に
(setq-default ac-sources '( ac-source-filename
			    ac-source-words-in-same-mode-buffers
			    ac-source-yasnippet
			    ))
;; Emacs Lispモードではac-source-symbolsを追加で利用
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources
			 'ac-source-symbols t)))
;; cモードではヘッダから補完
;; (defun my:ac-c-headers-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers))
(require 'auto-complete-c-headers)
(add-hook 'c-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources
			 'ac-source-c-headers t)))
(require 'processing-mode)
(defun processing-mode-init ()
  (make-local-variable 'ac-sources)
  (setq ac-sources '(ac-source-dictionary ac-source-yasnippet))
  (make-local-variable 'ac-user-dictionary)
  (setq ac-user-dictionary (append processing-functions
                                   processing-builtins
                                   processing-constants)))
(add-to-list 'ac-modes 'processing-mode)
(add-hook 'processing-mode-hook 'processing-mode-init)
