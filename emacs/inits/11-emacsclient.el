;; server
(require 'server)

(unless (server-running-p)
  (server-start))
(defun iconify-emacs-when-server-is-done()
  (unless server-clients (iconify-frame)))
;; emacsclient経由でバッファを消すときに出る確認を削除
(remove-hook
 'kill-buffer-query-functions
 'server-kill-buffer-query-function)
;; 終了したらアイコン化
(add-hook 'server-done-hook 'iconify-emacs-when-server-is-done) 
;; 終了キーに割り当て
(global-set-key (kbd "C-x C-c") 'server-edit)
;; M-x exitで終了
(defalias 'exit 'save-buffers-kill-emacs)

(remove-hook
'kill-buffer-query-functions 
'server-kill-buffer-query-function)
