(require 'elscreen)
(require 'elscreen-persist)
;;; プレフィクスキーはC-z
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
;; タブ永続化
(elscreen-persist-mode 1)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
;; タブ移動を簡単に
(define-key global-map (kbd "M-t") 'elscreen-next)
(define-key global-map (kbd "M-T") 'elscreen-previous)
;;; バッファ名・モード名からタブに表示させる内容を決定する(デフォルト設定)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dir(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Inf(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))
;; elscreenごとにバッファを分ける
(require 'elscreen-separate-buffer-list)
(elscreen-separate-buffer-list-mode 1)
;; C-z C-c  新しいelscreenを作る
;; C-z C-k  現在のelscreenを削除する
;; C-z M-k  現在のelscreenをバッファごと削除する
;; C-z K    ほかの全elscreenを削除する！
;; C-z C-n  次のelscreenを選択
;; C-z C-p  前のelscreenを選択
;; C-z C-a  直前に選択したelscreenを選択
;; C-z C-f  新しいelscreenでファイルを開く
;; C-z b    新しいelscreenでバッファを開く
;; C-z d    新しいelscreenでdiredを開く
