" カラースキーム
colorscheme hybrid
" シンタックスハイライト
syntax on
" 隠れバッファ有効化
set hidden
" アローキー左右で行をまたぐ
set whichwrap+=<,>,[,]
" 折りたたみ
set foldmethod=marker
" UTF-8を使う {{{
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
setl fileencoding=utf-8
setl fileformat=unix
" }}}

" 画面表示関連 {{{

" 行番号表示
set number
" 現在行をハイライト
set cursorline
" ステータス行の表示
set laststatus=2
" メッセージ欄の行数
set cmdheight=2
" 不可視文字の表示
set list
set listchars=tab:>\ ,extends:<,trail:-,eol:<
hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
" サーチ結果をハイライト
set hlsearch
" comceal属性文字の表示
set conceallevel=2
set concealcursor=i
" }}}
" autoindent
set autoindent
" tab幅４
set tabstop=4
" osのクリップボード有効化
set clipboard+=unnamed
" インクリメンタルサーチ
set incsearch
set ignorecase
set smartcase
set wrapscan
set wildmenu
set showmatch

set backup " {{{
if has('persistent_undo')
    set undodir=~/.vim/undo
    if !isdirectory(&undodir)
        call mkdir(&undodir)
    endif
    set undofile
endif " }}}

set history=10000
set backspace=indent,eol,start

" vimshellが使えなくなる
" if exists('+autochdir')
" 	set autochdir
" endif

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap <silent> ss :<C-u>split<CR>
nnoremap <silent> sv :<C-u>vsplit<CR>
nnoremap sk <C-w>k
nnoremap <silent> sl <C-w>l:call <SID>good_width()<Cr>
nnoremap <silent> sh <C-w>h:call <SID>good_width()<Cr>
nnoremap sJ <C-w>J
" windowの幅調整
function! s:good_width()
  if winwidth(0) < 84
    vertical resize 84
  endif
endfunction

nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap sw <C-w>w
nnoremap <silent> sN :<C-u>bnext<CR>
nnoremap <silent> sP :<C-u>bprevious<CR>
nnoremap <silent> st :<C-u>tabnew<CR>
nnoremap <silent> sq :quit<CR>
nnoremap <silent> sQ :quitall<CR>
