set nocompatible              " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Markdown'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/Rainbow-Parenthesis'
Plugin 'vim-scripts/bad-whitespace'
Plugin 'tpope/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-endwise'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

let mapleader = ","

nnoremap ; :
vnoremap : ;

" search
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch

set mouse=a                   " mouse integration - sometimes I'm lazy.
set shell=bash\ -l            " load my bash profile when I shell out


" Escape with jk mashing
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>set backspace=indent,eol,start

" tab/spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set backspace=2
set autoindent
set smartindent

" clipboard/pasting
set clipboard=unnamedplus,unnamed,autoselect

" line number settings
set number

" searches are case-insensitive, unless they contain upper-case:
set ignorecase
set smartcase

" status bar stuff
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

syntax enable

if $TERM == "xterm-256color"
  set t_Co=256
endif
set background=dark


map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
set splitbelow
set splitright

" reload vimrc on save
augroup vimrc
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END
