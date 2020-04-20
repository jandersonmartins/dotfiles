set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
" Syntax highlight
Plugin 'jelera/vim-javascript-syntax'
Plugin 'styled-components/vim-styled-components'
Plugin 'leafgarland/typescript-vim'
Plugin 'jparise/vim-graphql'
" Theme
Plugin 'jacoborus/tender.vim'
Plugin 'haishanh/night-owl.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

call vundle#end() 

"NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.swp$', '.DS_Store', '.git', 'node_modules']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP
" Ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'

" Theme
colorscheme night-owl

"Airline Theme
let g:airline_theme='minimalist'

" General config
let g:netrw_banner = 0

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab 

set autoindent

syntax on
syntax enable
