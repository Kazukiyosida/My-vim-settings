" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化 
" NeoBundleを更新するための設定
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'honza/snipmate-snippets'

call neobundle#end()

" 読み込むプラグインを記載
" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

" PROCESSING実行用の設定(runpde.BATが必要)
let g:quickrun_config = {}
let g:quickrun_config.processing =  {
      \     'command': 'runpde.BAT',
      \     'exec': '%c %s ' ,
      \   }

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

set number
set mouse=a
set fileencoding=utf-8
set fileformat=unix
set list
set autoindent
set listchars=tab:>\ ,extends:<,trail:-,eol:<
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard+=unnamed
set clipboard=unnamed
set nobackup
set noswapfile
set cursorline
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

au BufnewFIle,BufRead *.pde setf processing

