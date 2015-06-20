(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(and (equal current-language-environment "Japanese")
     (require 'anything-migemo nil t))
;; (require 'anything-startup)

(define-key global-map (kbd "C-c C-a") 'anything)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

(require 'ibuffer)
(require 'anything-c-moccur)
(setq moccur-split-word t)
;`anything-idle-delay'
(setq anything-c-moccur-anything-idle-delay 0.1
;`anything-c-moccur-dmoccur'などのコマンドでバッファの情報をハイライトする
      anything-c-moccur-higligt-info-line-flag t
;現在選択中の候補の位置を他のwindowに表示する
      anything-c-moccur-enable-auto-look-flag t
;起動時にポイントの位置の単語を初期パターンにする      
      anything-c-moccur-enable-initial-pattern t)

(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
(define-key isearch-mode-map (kbd "C-o") 'anything-c-moccur-from-isearch)
(define-key isearch-mode-map (kbd "C-M-o") 'isearch-occur)

