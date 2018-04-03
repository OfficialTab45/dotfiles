set nocompatible
filetype off
syntax on
set noswapfile
set laststatus=2
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nerdtree'
filetype plugin indent on
call vundle#end()
let g:airline_theme='jellybeans'
colorscheme PaperColor
set background=dark
let g:airline_powerline_fonts = 1
