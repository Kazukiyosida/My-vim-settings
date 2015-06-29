" NERDtree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowLineNumbers=1

" migemo
if has("migemo")
	set migemo
	set migemodict=/usr/share/cmigemo/utf-8/migemo-dict
endif

" incsearch.vim
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
map! <C-j> <Plug>(skk-toggle-im)
let g:skk_jisyo=expand('~/SKK-JISYO.L')

