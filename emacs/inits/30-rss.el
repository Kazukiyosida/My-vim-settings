(require 'newsticker)
(setq newsticker-url-list
      '(
	("BTOパソコン.jp" "http://feeds.feedburner.com/BTOpc?format=xml")
	("GIGAZINE" "http://feed.rssad.jp/rss/gigazine/rss_2.0")
	("日刊Emacs" "http://rubikitch.com/feed/")
	("Vim-jp" "http://vim-jp.org/rss.xml")
	("PC watch" "http://rss.rssad.jp/rss/impresswatch/pcwatch.rdf")
	("窓の杜" "http://rss.rssad.jp/rss/forest/rss.xml")
	("スラド" "http://srad.jp/sradjp.rss")
	("週刊アスキー" "http://weekly.ascii.jp/cate/1/rss.xml")
	))
(defvar newsticker-display-interval 0)
(setq browse-url-browser-function 'eww-browse-url)

(require 'eww)

(defun eww-disable-images ()
  "ewwで画像表示させない"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))
(defun eww-enable-images ()
  "ewwで画像表示させる"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))

(provide 'mylisp-eww-image)
