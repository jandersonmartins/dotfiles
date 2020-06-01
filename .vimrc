set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
" Syntax highlight
Plug 'jelera/vim-javascript-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
" Theme
Plug 'haishanh/night-owl.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <F2> <Plug>(coc-rename)

"commenter
inoremap jk <ESC>
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-c> <plug>NERDCommenterToggle

" CtrlP
" Ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'

"NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['.swp$', '.DS_Store', '.git', 'node_modules']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-b> :NERDTreeToggle<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Theme
colorscheme night-owl
set bg=dark

" General config
let g:netrw_banner = 0

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

"------------Start html/css/js----------------
au BufRead,BufNewFile *.js,*.html,*.css set shiftwidth=2
au BufRead,BufNewFile *.js,*.html,*.css set expandtab
au BufRead,BufNewFile *.js,*.html,*.css set softtabstop=2

set expandtab
set autoindent
set number
set noswapfile

syntax on
syntax enable
