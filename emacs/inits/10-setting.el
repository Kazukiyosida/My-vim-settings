;; GNU Emacs非表示
(setq inhibit-startup-screen t)
;; タブキー
(setq tab-width 4)
;; タイトルバーにファイル名を表示する
;; (setq frame-title-format (format "%%f" (system-name)))
(setq frame-title-format '("[%b] - Emacs "))
;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;; 現在の関数名をウィンドウ上部に表示する。
(which-function-mode 1)
;; 括弧のハイライト
(show-paren-mode 1)
(defvar show-paren-style 'mixed)
;; 時刻表示
(display-time)
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
(global-set-key "\C-x\C-b" 'ibuffer)
;; ミニバッファを再帰的に呼び出すのを許可
(setq enable-recursive-minibuffers t)
;; ダイアログボックスを使わない
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;; 履歴を1000個保存
(setq history-length 1000)
;; キー入力を素早く表示
(setq echo-keystrokes 0.1)
;; 25MB以上のファイルを開いた時に警告
(setq large-file-warning-threshold (* 25 1024 1024))
;; ミニバッファで入力を取り消しても履歴が残るように
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
;; yesをyに、noをnに
(defalias 'yes-or-no-p 'y-or-n-p)
;; ファイルを開くときわかりやすく
(ido-mode 1)
(defvar ido-everywhere 1)
;; backup の保存先設定
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
