;; skk
(require 'skk)
;;(setq skk-isearch-mode-enable 'always)
; isearchでskkのセットアップ(migemoがあるのでいらない)
;; (add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
;;; isearch で skk のクリーンアップ
;; (add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup) 
;;; isearch で skk の初期状態
;; (setq skk-isearch-start-mode 'latin)
;; 動的補完の複数表示群のフェイス
(set-face-foreground 'skk-dcomp-multiple-face "ghost white")
(set-face-background 'skk-dcomp-multiple-face "Orange3")
(set-face-bold 'skk-dcomp-multiple-face t)
;; 動的補完の複数表示郡の補完部分のフェイス
(set-face-foreground 'skk-dcomp-multiple-trailing-face "ghost white")
(set-face-bold 'skk-dcomp-multiple-trailing-face t)
;; 動的補完の複数表示郡の選択対象のフェイス
(set-face-foreground 'skk-dcomp-multiple-selected-face "ghost white")
(set-face-background 'skk-dcomp-multiple-selected-face "SkyBlue4")
(set-face-bold 'skk-dcomp-multiple-selected-face t)
;; 動的補完時に下で次の補完へ
;;(define-key skk-j-mode-map (kbd "<down>") 'skk-completion-wrapper)
;; Enterで改行しない
(setq skk-egg-like-newline t)
;; ▼モードで一つ前の候補を表示
(setq skk-delete-implies-kakutei nil)
;; 英語補完
(setq skk-use-look t)
;; 閉じカッコを自動的に
(setq skk-auto-insert-paren nil)
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)

;; 候補表示
; 変換候補の表示位置
;; (setq skk-show-inline t)
;; (setq skk-show-tooltip t)						  
(setq skk-show-candidates-always-pop-to-buffer t)
; 候補表示件数を2列に
(setq skk-henkan-show-candidates-rows 2) 

;; 動的候補表示
;; 動的補完
(setq skk-dcomp-activate t)
;; 動的補完の複数候補表示
(setq skk-dcomp-multiple-activate t)
;; 動的補完の候補表示件数
(setq skk-dcomp-multiple-rows 10)

;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;; ヒント
(require 'skk-hint)

;; コード中では自動的に英字にする。
(add-hook 'skk-load-hook
          (lambda ()
            (require 'context-skk)))
;; annotation
(setq skk-show-annotation t)
(require 'skk-study)

;; 言語
;; エラーを日本語に
(setq skk-japanese-message-and-error nil)
;; メニューを日本語に
(setq skk-show-japanese-menu nil)	
