(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; backup の保存先設定
;; (add-to-list 'backup-directory-alist
;;              (cons (expand-file-name "~/") (expand-file-name "~/.Trash/")))
(setq-default backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
	    backup-directory-alist))
(setq-default auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))


;; package maneger
(require 'package)
(add-to-list 'package-archives ' ("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives ' ("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(defun init-loader-re-load (re dir &optional sort)
  (let ((load-path (cons dir load-path)))
    (dolist (el (init-loader--re-load-files re dir sort))
      (condition-case e
          (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
            (init-loader-log (format "loaded %s. %s" (locate-library el) time)))
        (error
         ;; (init-loader-error-log (error-message-string e)) ；削除
         (init-loader-error-log (format "%s. %s" (locate-library el) (error-message-string e))) ;追加
         )))))


