;; コメントで実行結果注釈
(require 'lispxmp)

;; 括弧の対応をとる
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(global-set-key (kbd "C-m") 'newline-and-indent)

;; eldoc拡張
(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)

;; 関数定義へ飛ぶ
(find-function-setup-keys)

;; helpにメモを注釈
(require 'usage-memo)
(setq umemo-base-directory "~/.emacs.d/umemo")
(umemo-initialize)

;; list変数を編集
(require 'edit-list)

;; unit test
(require 'el-mock)
(require 'ert-expectations)

;; cl-lib
(require 'cl-lib-highlight)
(cl-lib-highlight-initialize)









