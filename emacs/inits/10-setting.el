;; GNU Emacs非表示
(setq inhibit-startup-screen t)

;; fullscreen(daemonで起動すると不発する)
;(set-frame-parameter nil 'fullscreen 'fullboth)
; for window system
; (if window-system 
;     (progn
;       (set-frame-parameter nil 'alpha 95)))
;; font
; (create-fontset-from-ascii-font
;        "Source Han Code JP-14:weight=normal:slant=normal"
;        nil "codekakugo")
; (set-fontset-font "fontset-codekakugo"
;                         'unicode
;                         (font-spec :family "Source Han Code JP" :size 16) 
;                         nil 
;                         'append)
; (add-to-list 'default-frame-alist '(font . "fontset-codekakugo"))

;; theme
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'desert t)
(enable-theme 'desert)
;; タブキー
(setq tab-width 8)
;; タイトルバーにファイル名を表示する
(setq frame-title-format '("[%b] - Emacs "))
;; avoid "Symbolic link to SVN-controlled source file; follow link? (y or n)"
(setq vc-follow-symlinks t)
;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;; 現在の関数名をウィンドウ上部に表示する。
;; (which-function-mode 1)
;; (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
;; (setq-default header-line-format '(which-func-mode ("" which-func-format)))
;; モードラインの改行文字の表示
(setq eol-mnemonic-dos "(DOS)")
(setq eol-mnemonic-unix "(Unix)")
(setq eol-mnemonic-mac "(Mac)")
(setq eol-mnemonic-undecided "(N/A)")  
;; 括弧のハイライト
(show-paren-mode 1)
(defvar show-paren-style 'mixed)
;; 時刻表示
;; (defvar display-time-24hr-format t)
;; (display-time-mode t)
;; 行、列番号表示
(line-number-mode 1)
(column-number-mode 1)
;; 選択範囲をハイライト
(transient-mark-mode 1)
;; gc許容量を15倍に
(setq gc-cons-threshold(* 15 gc-cons-threshold))
;; ログをたくさん保存
(setq message-log-max 10000)
;; 履歴を永続化
(savehist-mode 1)
;; ibufferを使う
(require 'ibuffer)
(global-set-key "\C-x\C-b" 'ibuffer)
(add-hook 'ibuffer-mode-hook (ibuffer-auto-mode 1))
;; ミニバッファを再帰的に呼び出すのを許可
(setq enable-recursive-minibuffers t)
;; ダイアログボックスを使わない
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;; 履歴を1000個保存
(setq history-length 1000)
;; キー入力を素早く表示
(setq echo-keystrokes 0.1)
;; 50MB以上のファイルを開いた時に警告
(setq large-file-warning-threshold (* 50 1024 1024))
;; ミニバッファで入力を取り消しても履歴が残るように
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
;; yesをyに、noをnに
(defalias 'yes-or-no-p 'y-or-n-p)
;; ファイルを開くときわかりやすく
(ido-mode 1)
(defvar ido-everywhere 1)
(defvar ido-enable-flex-matching t)
;; #!に実行権をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; ehellの設定
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
;; backup の保存先設定
;; (add-to-list 'backup-directory-alist
;;              (cons (expand-file-name "~/") (expand-file-name "~/.Trash/")))
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
