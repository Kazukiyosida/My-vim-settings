;;elファイルの自動コンパイル 
(unless (require 'auto-async-byte-compile nil t)
  (package-refresh-contents)
  (package-install 'auto-async-byte-compile))
(require 'auto-async-byte-compile)
(defvar auto-async-byte-comlile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)


;; インストールするパッケージのリスト
(defvar my-packages
  '(
    use-package
    
    recentf-ext

    auto-save-buffers-enhanced

    redo+

    crosshairs

    volatile-highlights

    swap-buffers

    auto-complete

    yasnippet

    auto-complete-c-headers
    
    ))

;; パッケージ確認、ない場合インストール
(dolist (package my-packages)
  (unless (require package nil t)
    (package-refresh-contents)
    (package-install package)))

