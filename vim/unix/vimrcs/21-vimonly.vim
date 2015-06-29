" vimfiler
let g:vimfiler_as_default_explorer = 1
autocmd vimrc FileType vimfiler nnoremap q <Plug>(vimfiler_exit)
autocmd vimrc FileType vimfiler nnoremap Q :<C-U>quit<CR>
" vimshell
let g:vimshell_execute_file_list = {}
for ext in split('txt,vim,c,h,cpp,d,xml,java,pde', ',')
    let g:vimshell_execute_file_list[ext] = 'vim'
endfor
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '
