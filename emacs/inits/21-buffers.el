;; バッファ名がかぶった時にわかりやすく
(require 'uniquify)
;; filename<dir>の形式で表示
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたファイルは無視する
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; ibufferでido
(require 'ibuffer)
(define-key ibuffer-mode-map (kbd "C-x C-f") 'ido-find-file)

;; ibuffer-vc
(require 'ibuffer-vc)
;;; リポジトリ順にする
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))
;;; ibufferにVC statusを表示させる
(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))

;; Dired
(require 'dired)
(require 'dired-aux)
;; カラーリング
;; (require 'dired-k)
;; (require 'stripe-buffer)
;; (add-hook 'dired-mode-hook 'stripe-listify-buffer)
;; (add-hook 'org-mode-hook 'turn-on-stripe-table-mode)
;; (define-key dired-mode-map (kbd "g") 'dired-k)
;; (add-hook 'dired-initial-position-hook 'dired-k)

;; 非同期化
(eval-after-load "dired-aux" '(require 'dired-async))

;; wdired
(eval-after-load "dired"
  '(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))
;; Dired file-unzip
;; (eval-after-load "dired-aux"
;;     '(progn
;;      (require 'cl)
;;(add-to-list 'dired-compress-file-suffixes 
;;	     '("\\.zip\\'" ".zip" "unzip"))))      '

(add-to-list 'dired-compress-file-suffixes 
	     '("\\.zip\\'" ".zip" "unzip"))

;; Dired file-zip
(eval-after-load "dired"
  '(define-key dired-mode-map "z" 'dired-zip-files))
(defun dired-zip-files (zip-file)
  "Create an archive containing the marked files."
  (interactive "sEnter name of zip file: ")
  ;; create the zip file
  (let ((zip-file (if (string-match ".zip$" zip-file) zip-file (concat zip-file ".zip"))))
    (shell-command 
     (concat "zip " 
             zip-file
             " "
             (concat-string-list 
              (mapcar
              #'(lambda (filename)
                  (file-name-nondirectory filename))
               (dired-get-marked-files))))))

  (revert-buffer)

  ;; remove the mark on all the files  "*" to " "
  ;; (dired-change-marks 42 ?\040)
  ;; mark zip file
  ;; (dired-mark-files-regexp (filename-to-regexp zip-file))
  )

(defun concat-string-list (list) 
   "Return a string which is a concatenation of all elements of the list separated by spaces" 
   (mapconcat #'(lambda (obj) (format "%s" obj)) list " "))

;; diredでマークをつけたファイルを開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "F") 'my-dired-find-marked-files)
     (defun my-dired-find-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'find-file fn-list)))))

;; diredでマークをつけたファイルをviewモードで開く
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "V") 'my-dired-view-marked-files)
     (defun my-dired-view-marked-files (&optional arg)
       "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
       (interactive "P")
       (let* ((fn-list (dired-get-marked-files nil arg)))
         (mapc 'view-file fn-list)))))
;; /で正規表現で絞り込み
(require 'dired-filter)
;; ディレクトリ展開
(require 'dired-subtree)
;;; iを置き換え
(define-key dired-mode-map (kbd "i") 'dired-subtree-insert)
;;; org-modeのようにTABで折り畳む
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-remove)
;;; C-x n nでsubtreeにナローイング
(define-key dired-mode-map (kbd "C-x n n") 'dired-subtree-narrow)
;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)
;;; ファイル名以外の情報を(と)で隠したり表示したり
(require 'dired-details)
(dired-details-install)
(setq dired-details-hidden-string "")
(setq dired-details-hide-link-targets nil)
(setq dired-details-initially-hide nil)

;;; dired-subtreeをdired-detailsに対応させる
(defun dired-subtree-after-insert-hook--dired-details ()
  (dired-details-delete-overlays)
  (dired-details-activate))
(add-hook 'dired-subtree-after-insert-hook
          'dired-subtree-after-insert-hook--dired-details)

;; find-dired対応
(defadvice find-dired-sentinel (after dired-details (proc state) activate)
  (ignore-errors
    (with-current-buffer (process-buffer proc)
      (dired-details-activate))))
;; (progn (ad-disable-advice 'find-dired-sentinel 'after 'dired-details) (ad-update 'find-dired-sentinel))

;;; ^をdired-subtreeに対応させる
(defun dired-subtree-up-dwim (&optional arg)
  "subtreeの親ディレクトリに移動。そうでなければ親ディレクトリを開く(^の挙動)。"
  (interactive "p")
  (or (dired-subtree-up arg)
      (dired-up-directory)))
(define-key dired-mode-map (kbd "^") 'dired-subtree-up-dwim)

;; image-dired
(require 'image-dired+)
(image-diredx-async-mode 1)

;; swap-buffers
(require 'swap-buffers)
(defun swap-buffers-keep-focus ()
  (interactive)
  (swap-buffers t))
;; swap-screenに倣ってf2/S-f2に割り当てる
(global-set-key [f2] 'swap-buffers-keep-focus)
(global-set-key [s-f2] 'swap-buffers)

;;  auto-save-buffers-enhanced
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-include-regexps '(".+")) ;全ファイル
;; not-save-fileと.ignoreは除外する
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$" "COMMIT_EDITMSG"))
;;; Wroteのメッセージを抑制
(setq auto-save-buffers-enhanced-quiet-save-p t)
;;; *scratch*も ~/.emacs.d/scratch に自動保存
(setq auto-save-buffers-enhanced-save-scratch-buffer-to-file-p t)
(setq auto-save-buffers-enhanced-file-related-with-scratch-buffer
      (locate-user-emacs-file "scratch"))
(auto-save-buffers-enhanced t)

;;; C-x a sでauto-save-buffers-enhancedの有効・無効をトグル
(global-set-key "\C-xas" 'auto-save-buffers-enhanced-toggle-activity)

;; If you're using CVS or Subversion or git
(auto-save-buffers-enhanced-include-only-checkout-path t) 
(auto-save-buffers-enhanced t)

;; 消さないバッファの設定
(require 'unkillable-scratch)
;; バッファリストの最後尾に回される
(setq unkillable-scratch-behavior 'bury)
;; 保護対象のバッファの正規表現リスト
(setq unkillable-buffers
      '("^\\*scratch\\*$" "^\\*daemon\\*$"))
(unkillable-scratch 1)

