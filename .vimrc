" .vimrc
" Ferdinand Salis

" must be first as may impact options below
set nocompatible

" download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
call plug#end()

if has("autocmd")
  filetype indent plugin on
  autocmd Filetype gitcommit setlocal spell textwidth=72
endif

if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark
  silent! colorscheme solarized
  call togglebg#map("<F5>")
endif

set visualbell
set showcmd
set wildmenu
set wildmode=full
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set encoding=utf-8 nobomb
set lazyredraw
set showmatch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set nowrap
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set cursorline
set scrolloff=5
set nostartofline
set list
set listchars=tab:\|\ ,
set shell=/usr/local/bin/bash
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set hidden
syntax on

if !empty(&viminfo)
  set viminfo^=!
endif

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

let mapleader = ' '
let maplocalleader = ' '
let g:ackprg = 'ag --nogroup --nocolor --column -a'

" FZF
nnoremap <silent> <Leader><Leader> :Files<CR>

" turn off search highlight
nnoremap <leader>n :nohlsearch<CR>
" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>
