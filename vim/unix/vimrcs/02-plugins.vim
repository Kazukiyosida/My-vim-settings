call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle自体を管理する
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインのリスト
" NeoBundle 'Shougo/vimproc.vim' {{{
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" }}}
NeoBundleLazy (has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'), { 'autoload' : {'insert' : '1'} }
NeoBundleLazy 'Shougo/neosnippet',{ 'autoload' : {'insert' : '1'} }
NeoBundleLazy 'Shougo/neosnippet-snippets', { 'autoload' : {'insert' : '1'} }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimshell.vim', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/unite-outline', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/vimfiler', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/unite-sudo', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/neobundle-vim-recipes', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'basyura/unite-matchers', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'tsukkee/unite-help', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'tacroe/unite-alias', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'mattn/unite-remotefile', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'thinca/vim-unite-history', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'mopp/unite-rss', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'osyo-manga/unite-quickfix', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'itchyny/unite-preview', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'ujihisa/unite-font', { 'depends' : 'Shougo/unite.vim' }
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/echodoc.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'modsound/gips-vim'
NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'haya14busa/niconicomment.vim'
" NeoBundleLasy 'haya14busa/incsearch.vim'{{{
NeoBundleLazy 'haya14busa/incsearch.vim' , {
						\ 'autoload' : {
		\     'mappings' : ['<Plug>(incsearch-']
		\   }
		\ } "}}}
NeoBundle 'osyo-manga/vim-vigemo'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-singleton'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'kana/vim-surround'
NeoBundle 'cohama/agit.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/wwwrenderer-vim'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'skk.vim'
NeoBundle 'vim-scripts/errormarker.vim'
NeoBundle 'sudo.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'kana/vim-smartchr'
" NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'autodate.vim'
NeoBundle 'sjl/gundo.vim'
"" NeoBundle 'choplin/unite-vim_hacks' {{{ 
NeoBundle 'choplin/unite-vim_hacks', { 'depends' :
						\['mattn/webapi-vim',
						\ 'mattn/wwwrenderer-vim' ,
						\ 'thinca/vim-openbuf' ,
						\ 'Shougo/unite.vim' ,]
				\} "}}}
NeoBundleLazy 'sophacles/vim-processing' , {'autoload' : {'filename_patterns' : '.*\.pde'}}

" colorschemes
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Wutzara/vim-materialtheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

" 趣味
NeoBundle 'thinca/vim-splash'
NeoBundle 'Jagua/vim-unite-toho', { 'depends' : 'Shougo/unite.vim' }

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck
