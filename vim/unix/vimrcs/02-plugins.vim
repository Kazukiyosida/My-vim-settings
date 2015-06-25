call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle自体を管理する
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck
