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
" Fallback is use the desert256 scheme if the base16 config below doesn't run
colorscheme desert256

if &diff
    colorscheme desert256
endif

" Attempt to load base16 color scheme as set in ~/.vimrc_background
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

set number

" Open/Close fold when hitting space
nnoremap <space> za
" Create new fold from visual block
vnoremap <space> zf " Doesn't work with foldmethod=indent

autocmd Syntax python normal zR

autocmd FileType gitcommit setlocal spell
autocmd FileType tex setlocal spell
autocmd FileType rst setlocal spell
