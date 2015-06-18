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

;; imenu-list
(require 'imenu-list)
(global-set-key (kbd "C-'") #'imenu-list-minor-mode)
(with-eval-after-load "imenu-list"
  (define-key imenu-list-major-mode-map (kbd "j") 'next-line)
  (define-key imenu-list-major-mode-map (kbd "k") 'previous-line))
(setq imenu-list-size 0.15)
