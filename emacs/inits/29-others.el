;; カーソル位置記憶
(require 'saveplace)
(setq-default save-place t)

;; コンパイルウインドウが自動で閉じるようにする
(require 'bury-successful-compilation)
(bury-successful-compilation 1)

;; 使い捨てファイルの設定
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m/%d-%H%M%S.")

;; 十字ハイライト
(require 'crosshairs)
(crosshairs-toggle-when-idle 1)
(hl-line-when-idle-interval 0)
(col-highlight-set-interval 4)

;; ハイライトの色
(custom-set-faces
 '(col-highlight((t (:background "Forestgreen")))))
(custom-set-faces
 '(hl-line ((t (:background "Forestgreen")))))

;; undo,yank時にハイライト
(require 'volatile-highlights)
(volatile-highlights-mode t)
;; 複数シェル
(require 'multi-eshell)
;; bash_historyから取り込み
(require 'shell-history)
;; 画面分割しないoccur
(require 'loccur)

;; メッセージ抑制
(require 'shut-up)
(when noninteractive
  (shut-up-silence-emacs))


;; ido拡張
(require 'smex)
(smex-initialize)
(setq ido-enable-flex-matching t)       ;あいまいマッチ
(setq ido-max-window-height 1.0)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defvar org-completion-use-ido t)
(defvar magit-completing-read-function 'magit-ido-completing-read)
(defvar ido-ubiquitous-mode 1)
;;; skk使いはC-jをskk-modeにする
(when (fboundp 'skk-mode)
  (fset 'ido-select-text 'skk-mode))
;; 候補選択を縦に
(require 'ido-vertical-mode)
;; ido-anywhere
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-enable-flex-matching t)       ;あいまいマッチ
(global-set-key (kbd "C-.") 'ido-imenu-anywhere)

;; 外部コマンド実行をido化
(require 'projector)
(require 'ido-occasional)
;;; M-!を置き換え。
(global-set-key (kbd "M-!") 'projector-run-shell-command-current-directory/with-ido)
;;; コマンドが正規表現にマッチしていれば自動でバックグラウンド実行になる
(setq projector-always-background-regex '("^mysql.server\\.*" "^powder\\.*" "sleep"))
;;; fix bug
(defvaralias 'projector-command-history 'shell-command-history)
(define-key minibuffer-local-completion-map " " nil)

;; idoでdescribe-function
(global-set-key (kbd "<f1> f") (with-ido-completion describe-function))
;; idoでdescribe-variable
(global-set-key (kbd "<f1> v") (with-ido-completion describe-variable))
;;(global-set-key (kbd "<f2> i") (with-ido-completion info-lookup-symbol))


(defvar flx-ido-mode 1)
(setq ido-enable-flex-matching t)


;; imenu-list
(require 'imenu-list)
(global-set-key (kbd "C-'") #'imenu-list-minor-mode)
(with-eval-after-load "imenu-list"
  (define-key imenu-list-major-mode-map (kbd "j") 'next-line)
  (define-key imenu-list-major-mode-map (kbd "k") 'previous-line))
(setq imenu-list-size 0.25)

;; image+
(require 'image+)
(imagex-auto-adjust-mode 1)
(imagex-global-sticky-mode 1)
;; C-c + / C-c -	拡大、縮小
;; C-c M-l / C-c M-r	画像の回転
;; C-c M-o	元画像の表示

;; emms
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(require 'igrep)
;; lgrep -Ou8でutf8出力
(igrep-define lgrep (lgrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))
(igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -Ou8"))

;; grep-a-lot
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
(grep-a-lot-advise igrep)

(require 'wgrep)
;;; eでwgrepモードにする
(setf wgrep-enable-key "e")
;;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)
