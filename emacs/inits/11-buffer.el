;; バッファ名がかぶった時にわかりやすく
(require 'uniquify)
;; filename<dir>の形式で表示
(setq uniquify-buffer-name-style 'post-forward-angle-brakets)
;; *で囲まれたファイルは無視する
(setq uniquify-ignore-buffers-re "*[^*]+*")

(ido-mode 1)
(defvar ido-everywhere 1)
