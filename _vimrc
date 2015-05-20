" vim�N�����̂�runtimepath��neobundle.vim��ǉ�
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vim�̏����� 
" NeoBundle���X�V���邽�߂̐ݒ�
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

" �ǂݍ��ރv���O�C�����L��
" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o�A�t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on

" �C���X�g�[���̃`�F�b�N
NeoBundleCheck
let g:quickrun_config = {}
let g:quickrun_config.processing =  {
      \     'command': 'runpde',
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
set fileencodings=utf-8
set fileformat=unix
set list
set autoindent
set listchars=tab:>\ ,extends:<,trail:-,eol:<
set tabstop=4
set softtabstop=4
set shiftwidth=4
set clipboard+=unnamed
set clipboard=unnamed
set cursorline
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

au BufnewFIle,BufRead *.pde setf processing

