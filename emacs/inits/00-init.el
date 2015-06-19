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

    migemo

    electric-spacing

    quickrun

    win-switch

    ddskk

    bury-successful-compilation

    open-junk-file

    anything

    anything-exuberant-ctags

    anything-git-files

    anything-git-grep

    anything-milkode

    anything-project

    anything-replace-string

    anything-sage

    anything-prosjekt

    elscreen

    elscreen-persist

    imenu-list

    dired-filter

    dired-subtree

    dired-details

    git-gutter

    magit
    
    image+

    image-dired

    emms

    unkillable-scratch
    
    ))

;; パッケージ確認、ない場合インストール
(dolist (package my-packages)
  (unless (require package nil t)
    (package-refresh-contents)
    (package-install package)))

