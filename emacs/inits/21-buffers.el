;; バッファ名がかぶった時にわかりやすく
(require 'uniquify)
;; filename<dir>の形式で表示
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたファイルは無視する
(setq uniquify-ignore-buffers-re "*[^*]+*")

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
(setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
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
