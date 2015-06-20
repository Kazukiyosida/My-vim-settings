(require 'ibuffer)
(require 'color-moccur)
(setq moccur-split-word t)
;; migemoがrequireできる環境ならmigemoを使う
(when (require 'migemo nil t)
  (setq moccur-use-migemo t))

