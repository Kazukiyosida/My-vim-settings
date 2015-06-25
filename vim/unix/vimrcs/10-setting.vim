" シンタックスハイライト
syntax on
" 隠れバッファ有効化
set hidden
" アローキー左右で行をまたぐ
set whichwrap+=<,>,[,]

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
set 
" }}}
set autoindent
