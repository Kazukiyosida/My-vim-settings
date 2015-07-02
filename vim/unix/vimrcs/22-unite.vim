" unite
let g:unite_enable_start_insert = 1
" The prefix key.
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
" unite.vim keymap
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]F :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]l :<C-u>Unite menu:Launcher<CR>
nnoremap <silent> [unite]vr :UniteResume<CR>/"
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]th :<C-u>Unite toho -direction=botright -prompt-direction=top -winheight=5<CR>
nnoremap <silent> sf :<C-u>UniteWithBufferDir -direction=botright -prompt-direction=top -winheight=15 -buffer-name=files file<CR>
nnoremap <silent> sb :<C-u>Unite -direction=botright -prompt-direction=top -winheight=15 buffer<CR>
nnoremap <silent> sc :<C-u>Unite -buffer-name=register  -direction=botright -prompt-direction=top -winheight=15 register<CR>
nnoremap <silent> sm :<C-u>Unite -direction=botright -prompt-direction=top -winheight=15 file_mru<CR>
nnoremap <silent> sg :<C-u>Unite -direction=botright -prompt-direction=top -winheight=5 -no-start-insert menu:Git<CR>
nnoremap <silent> su :<C-u>Unite -no-split -buffer-name=files buffer file file_mru<CR>
nnoremap <silent> sx :<C-u>Unite -direction=botright -prompt-direction=top -winheight=15 command<CR>
nnoremap <silent> q: :<C-u>Unite -direction=botright -prompt-direction=top -winheight=10 history/command<CR>
autocmd vimrc FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd vimrc FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" unite-comple
imap <C-k> <Plug>(neocomplete_start_unite_complete)

" unite-rss
let g:unite_source_rss_url_dict = {
        \ '暗黒美夢王の間' : 'http://vinarian.blogspot.jp/rss.xml',
        \ 'Big Sky' : 'http://mattn.kaoriya.net/index.rss',
        \ 'もぷろぐ' : 'http://ac-mopp.blogspot.jp/rss.xml',
        \ }

" unite-alias
let g:unite_source_alias_aliases = {
\   'Dropbox' : {
\     'source': 'file_rec',
\     'args': '~/Dropbox',
\   },
\   'Documents' : {
\     'source': 'file_rec',
\     'args': '~/Documents',
\   },
\   'dotfiles' : {
\     'source': 'file_rec',
\     'args': '~/workspace/dotfiles',
\   },
\   'Junk-Codes' : {
\     'source': 'file_rec',
\     'args': '~/.vim/junk',
\   },
\ }

" :Unite menu
let g:unite_source_menu_menus = {
\   "Launcher" : {
\       "description" : "unite-menu-launcher",
\       "command_candidates" : [
\           ["Unite dotfiles", "Unite dotfiles"],
\           ["Unite anything", "Unite buffer file file_mru"],
\           ["Unite general", "Unite file_rec/async:~/"],
\           ["Unite-file_mru", "Unite file_mru"],
\           ["Unite-quickfix", "Unite quickfix"],
\           ["Unite colorscheme", "Unite -auto-preview colorscheme"],
\           ["Unite-output:message", "Unite output:message"],
\       ],
\   },
\   "Git" : {
\       "description" : "unite-menu-Git",
\       "command_candidates" : [
\           ["git status", "Gstatus"],
\           ["git log", "Agit"],
\           ["git commit", "Gcommit"],
\           ["git push", "Gpush"],
\           ["git pull", "Gpull"],
\       ],
\   },
\}

" あいまいマッチ
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" use vigemo
if executable('cmigemo')
	call unite#custom_source('register', 'matchers', "matcher_vigemo")
	call unite#custom_source('toho', 'matchers', "matcher_vigemo")
	call unite#custom_source('vim_hacks', 'matchers', "matcher_vigemo")
	call unite#custom_source('rss', 'matchers', "matcher_vigemo")
endif
" 2文字入力した時から絞り込みを開始する
let g:unite#filters#matcher_vigemo#filtering_input_length = 2

call unite#custom_source('command', 'matchers', "matcher_glob")
call unite#custom_source('history/command', 'matchers', "matcher_glob")
"" function removed.
" call unite#custom_filters('file_mru',
"       \ ['matcher_file_name', 'sorter_default', 'converter_file_directory'])
call unite#custom_source('file_rec/async', 'matchers', "matcher_glob")
call unite#custom_source('file_rec/async', 'converters', "converter_file_directory")
call unite#custom_source('file_rec/async', 'max_candicates', "99999")
call unite#custom_source('file_mru', 'matchers', "matcher_file_name")
call unite#custom_source('file_mru', 'converters', "converter_file_directory")

" unite-toho:
let g:unite_toho_lang_hack = 1
let g:unite_toho_config = [{
\   'title'          : 'th13  : 東方輝針城',
\   'dirname'        : '/usr/local/bin/',
\   'th_command'     : 'th14',
\ }, {
\   'title'          : 'th143 : 弾幕アマノジャク',
\   'dirname'        : '/usr/local/bin/',
\   'th_command'     : 'th143',
\ }]

