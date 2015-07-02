(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))


;; package maneger
(require 'package)
(add-to-list 'package-archives ' ("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives ' ("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; init-loader
(unless (require 'init-loader nil t)
  (package-refresh-contents)
  (package-install 'init-loader))
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


