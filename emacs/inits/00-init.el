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

    undo-tree

    undohist

    idomenu

    smex

    ido-vertical-mode

    ido-ubiquitous

    elscreen-separate-buffer-list

    point-undo

    goto-chg

    yatemplate

    color-moccur

    multi-eshell

    key-chord

    shell-history

    yatex

    pdf-tools

    grep-a-lot

    igrep

    wgrep

    loccur

    dired-toggle

    dired-toggle-sudo

    dired-k

    stripe-buffer

    direx

    async

    projector

    ido-occasional

    processing-mode

    processing-snippets

    shut-up

    ibuffer-vc

    viewer

    image-dired+

    shell-pop
    
    ))

;; パッケージ確認、ない場合インストール
(require 'package)
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))
