;; magit
(require 'magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'git-gutter)
(global-git-gutter-mode t)
;; 更新頻度を減らす
;; (setq git-gutter:update-hooks '(after-save-hook after-revert-hook))

