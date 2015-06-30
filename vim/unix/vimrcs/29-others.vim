" NERDtree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeBookmarksFile=expand('~/.vim/NERDTreeBookmarks')

" migemo
if has("migemo")
	set migemo
	set migemodict=/usr/share/cmigemo/utf-8/migemo-dict
endif

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" pdf を現在位置に挿入
if executable('pdftotext')
    command! -complete=file -nargs=1 Pdf :r !pdftotext -nopgbrk -layout <q-args>
endif

" anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

nmap gW <Plug>(openbrowser-open)

" errormaker
let g:errormarker_errortext='!!'
let g:errormarker_warningtext='??'
let g:errormarker_errorgroup='Error'
let g:errormarker_warninggroup='Todo'

" skk
let g:skk_jisyo=expand('~/dict/SKK-JISYO.L')
let g:skk_auto_save_jisyo=1
let g:skk_marker_white="@"
let g:skk_marker_black="^"
let g:skk_egg_like_newline=1
let g:skk_sticky_key=';'

" airline
" let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr} %3l:%3c'

" lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  if &filetype == "help"
    return "help"
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return "help"
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

"smartchr
inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
inoremap <buffer> <expr> <S-=> smartchr#loop(' + ', '+')
inoremap <buffer> <expr> - smartchr#loop(' - ', '-')
inoremap <buffer> <expr> , smartchr#loop(', ', ',')
inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')

" proessing
let g:processing_fold = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" markdown
autocmd vimrc BufRead,BufNewFile *.md set filetype=markdown

" vinarize
let g:vinarise_enable_auto_detect = 1

" quickrun
let g:quickrun_config = {
\   '*': {'runmode': 'async:vimproc'},
\ }

" autodate
let autodate_format = '%d %3m %Y'
let autodate_keyword_pre = 'Last \%(Change\|Modified\):'

" Gundo.vim
nnoremap U      :<C-u>GundoToggle<CR>

" Open junk file."\{\{\{
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim/junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction"\}\}\}
