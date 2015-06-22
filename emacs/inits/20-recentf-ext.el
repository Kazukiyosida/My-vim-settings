(require 'recentf)
(require 'shut-up)
;; 最近のファイル3000個を保存
(setq recentf-max-saved-items 3000)
;; 除外ファイル
(setq recentf-exclude '("/TAGS$" "/var/tmp/" "/recentf$" "/\.bash_history$" "/\*daemon\*$"))
(require 'recentf-ext)
;; 履歴ファイルの設定
(setq recentf-save-file "~/.emacs.d/recentf")
;; 1分ごとに自動クリーン
(setq recentf-auto-cleanup nil)
;; 30秒放置でrecent保存
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)



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
          (remove-duplicates (mapcar #'car file-assoc-list)
                             :test #'string=))
         (filename (ido-completing-read "Choose recent file or directory: "
                                        filename-list nil t)))
    (when filename
      (find-file (cdr (assoc filename file-assoc-list))))))

(global-set-key (kbd "C-x C-h") 'recentf-ido-find-files-and-dirs)
