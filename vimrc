execute pathogen#infect()

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set autoindent " autoindent (filetype indenting instead)
"set nosmartindent " smartindent (filetype indenting instead)
"set cindent " do c-style indenting
set softtabstop=4 " unify
set shiftwidth=4 " unify
set tabstop=4 " real tabs should be 4, but they will show with set list on
set expandtab
"set copyindent " but above all -- follow the conventions laid before us
filetype plugin indent on " load filetype plugins and indent settings
syntax on

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

set list listchars=tab:>-,trail:.

set t_Co=256
colorscheme desert256

if &diff
    colorscheme desert256
endif

set number

" Open/Close fold when hitting space
nnoremap <space> za
" Create new fold from visual block
vnoremap <space> zf " Doesn't work with foldmethod=indent

autocmd Syntax python normal zR
