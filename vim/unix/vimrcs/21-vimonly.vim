" vimfiler
let g:vimfiler_as_default_explorer = 1
autocmd vimrc FileType vimfiler nnoremap q <Plug>(vimfiler_exit)
autocmd vimrc FileType vimfiler nnoremap Q :<C-U>quit<CR>
" vimshell
let g:vimshell_scrollback_limit=50000
let g:vimshell_vimshrc_path=expand('~/.vim/vimshrc')
let g:vimshell_execute_file_list = {}
for ext in split('txt,vim,c,h,cpp,d,xml,java,pde,md', ',')
    let g:vimshell_execute_file_list[ext] = 'vim'
endfor
let g:vimshell_external_history_path = expand('~/.bash-history')
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

nmap <C-@>  <Plug>(vimshell_switch)
nnoremap !  q:VimShellExecute<Space>
nnoremap [Space]i  q:VimShellInteractive<Space>
nnoremap [Space]t  q:VimShellTerminal<Space>
nnoremap <silent> [Space];  <C-u>:VimShellPop<CR>
