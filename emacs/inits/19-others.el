;; カーソル位置記憶
(setq-default save-place t)
(require 'saveplace)

;; 十字ハイライト
(require 'crosshairs)
(crosshairs-toggle-when-idle 1)
(hl-line-when-idle-interval 0)
(col-highlight-set-interval 3)

;; ハイライトの色
(custom-set-faces
 '(col-highlight((t (:background "lightgreen")))))
(custom-set-faces
 '(hl-line ((t (:background "lightgreen")))))

;; undo,yank時にハイライト
(require 'volatile-highlights)
(volatile-highlights-mode t)
