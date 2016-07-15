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
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'exu/pgsql.vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', { 'branch': 'develop' }
Plug 'pbrisbin/vim-colors-off'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline-themes'
" Color Themes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/seoul256.vim'
Plug 'tomasr/molokai'
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
let g:sql_type_default = 'pgsql'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:jsx_ext_required = 0
let g:ackprg = 'ag --nogroup --nocolor --column -a'
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" GitGutter
let g:gitgutter_enabled = 0
nnoremap <F9> :GitGutterToggle<cr>
" Undotree
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>(

" Nerdtree
nnoremap <F10> :NERDTreeToggle<cr>

" FZF
nnoremap <silent> <Leader><Leader> :Files<CR>

" turn off search highlight
nnoremap <leader>n :nohlsearch<CR>
" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>
