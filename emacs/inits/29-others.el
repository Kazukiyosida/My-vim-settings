;; カーソル位置記憶
(require 'saveplace)
(setq-default save-place t)

;; コンパイルウインドウが自動で閉じるようにする
(require 'bury-successful-compilation)
(bury-successful-compilation 1)

;; 使い捨てファイルの設定
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")

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
;;(require 'multi-eshell)
(require 'shell-pop)
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell shell-pop-term-shell))))
(global-set-key (kbd "C-c s") 'shell-pop)
;; bash_historyから取り込み
(require 'shell-history)
;; 画面分割しないoccur
(require 'loccur)

;;()をあれする
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 括弧の色を強調する設定
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)

;; multiple-cursors
(require 'multiple-cursors)
(defun mc/edit-lines-or-string-rectangle (s e)
  "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwim)"
  (interactive "r")
  (if (eq (save-excursion (goto-char s) (current-column))
          (save-excursion (goto-char e) (current-column)))
      (call-interactively 'mc/edit-lines)
    (call-interactively 'string-rectangle)))
(global-set-key (kbd "C-x r t") 'mc/edit-lines-or-string-rectangle)

(defun mc/mark-all-dwim-or-mark-sexp (arg)
  "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
  (interactive "p")
  (cl-case arg
    (16 (mc/mark-all-dwim t))
    (4 (mc/mark-all-dwim nil))
    (1 (mark-sexp 1))))
(global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-mark-sexp)

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
;; old M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defvar org-completion-use-ido t)
(defvar magit-completing-read-function 'magit-ido-completing-read)
(defvar ido-ubiquitous-mode 1)
;;; C-jをskk-modeにする
(when (fboundp 'skk-mode)
  (fset 'ido-select-text 'skk-mode))
;; 候補選択を縦に
(require 'ido-vertical-mode)
;; ido-anywhere
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-enable-flex-matching t)
(global-set-key (kbd "C-.") 'ido-imenu-anywhere)

;; 外部コマンド実行をido化
(require 'projector)
(require 'projectile)
(require 'ido-occasional)
;;; M-!を置き換え。
(global-set-key (kbd "M-!") (with-ido-completion projector-run-shell-command-current-directory))
;;; コマンドが正規表現にマッチしていれば自動でバックグラウンド実行になる
(setq projector-always-background-regex '("^mysql.server\\.*" "^powder\\.*" "sleep"))
;;; fix bug
(defvaralias 'projector-command-history 'shell-command-history)
(define-key minibuffer-local-completion-map " " nil)

;; idoでdescribe-function
(global-set-key (kbd "<f1> f") (with-ido-completion describe-function))
;; idoでdescribe-variable
(global-set-key (kbd "<f1> v") (with-ido-completion describe-variable))
(global-set-key (kbd "<f1> S") (with-ido-completion info-lookup-symbol))
(global-set-key (kbd "<f1> m") (with-ido-completion woman))
(with-ido-completion describe-package)	; => describe-package/with-ido

(defvar flx-ido-mode 1)
(setq ido-enable-flex-matching t)


;; 関数名を右端に
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

;; genericx
(require 'generic-x)

;; woman
(require 'woman)
;; 初回起動が遅いのでキャッシュを作成(更新は C-u を付けて woman を呼ぶ)
(setq woman-cache-filename (expand-file-name "~/.emacs.d/woman_cache.el"))
;; 新たにフレームは作らなくて良い
(setq woman-use-own-frame nil)
(setq ido-enable-flex-matching t)

;; 折りたたみ
(require 'fold-dwim)

;; graphviz
(require 'graphviz-dot-mode)

(require 'foreign-regexp)

(custom-set-variables
 '(foreign-regexp/regexp-type 'perl) ;; Choose by your preference.
 '(reb-re-syntax 'foreign-regexp)) ;; Tell re-builder to use foreign regexp.
