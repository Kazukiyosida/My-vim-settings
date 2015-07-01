(require 'recentf)
(require 'shut-up)
(require 'cl-lib)
;; 最近のファイル3000個を保存
(setq recentf-max-saved-items 3000)
;; 除外ファイル
(setq recentf-exclude '("/TAGS$" "/var/tmp/" "/recentf$" "/\.bash_history$" "/\\*daemon\\*$" "/session\..*" "/ido\.last$"))
;; directoryも含むようにする
(require 'recentf-ext)

;; recentf-listに変更が無かったらautosave、cleanしない
(defvar my-recentf-list-prev nil)
(defadvice recentf-save-list
    (around no-message activate)
  "If `recentf-list' and previous recentf-list are equal,
do nothing. And suppress the output from `message' and
`write-file' to minibuffer."
(unless (equal recentf-list my-recentf-list-prev)
    (cl-flet ((message (format-string &rest args)
		       (eval `(format ,format-string ,@args)))
	      (write-file (file &optional confirm)
			    (let ((str (buffer-string)))
			      (with-temp-file file
				(insert str))))))
    ad-do-it
    (setq my-recentf-list-prev recentf-list)))
 
(defadvice recentf-cleanup
  (around no-message activate)
  "suppress the output from `message' to minibuffer"
  (cl-flet ((message (format-string &rest args)
		     (eval `(format ,format-string ,@args))))
    ad-do-it))
;; 10秒ごとに自動クリーン 
(setq recentf-auto-cleanup 10)
;; 履歴ファイルの設定
(setq recentf-save-file "~/.emacs.d/recentf")
;; 30秒放置でrecent保存
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)



;; recentf-open-filesをidoで
(defun recentf-ido-find-files-and-dirs (arg)
  "Find a recent file and a directory using Ido."
  (interactive "P")
  (let* ((show-full-path-p (cond (arg t) (t nil)))
         (file-assoc-list
          (mapcar (lambda (x)
                    (cond ((equal (substring x (- (length x) 1) (length x)) "/")
                           (cons (file-name-directory x) x))
                          (t
                           (cond (show-full-path-p
                                  (cons x x))
                                 (t
                                  (cons (file-name-nondirectory x) x))))))
                  recentf-list))
         (filename-list
          (cl-remove-duplicates (mapcar #'car file-assoc-list)
                             :test #'string=))
         (filename (ido-completing-read "Choose recent file or directory: "
                                        filename-list nil t)))
    (when filename
      (find-file (cdr (assoc filename file-assoc-list))))))

(global-set-key (kbd "C-x C-h") 'recentf-ido-find-files-and-dirs)



