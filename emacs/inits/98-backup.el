;; backup の保存先設定
;; (add-to-list 'backup-directory-alist
;;              (cons (expand-file-name "~/") (expand-file-name "~/.Trash/")))
(setq-default backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq-default auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))

