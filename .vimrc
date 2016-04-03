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
Plug 'bling/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
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

if has("cmdline_info")
  set ruler
  set showcmd
  set showmode
endif

if has("wildmenu")
  set wildmenu
  set wildmode=longest,list
  if has ("wildignore")
    set wildignore+=*.a,*.pyc,*.o,*.orig
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.sw?,*.tmp
    set wildignore+=node_modules
  endif
endif

if has("extra_search")
  set hlsearch          " highlight matches
  set incsearch         " search as characters are entered
  set ignorecase
  set smartcase
endif

let mapleader=","       " leader is comma

set backspace=indent,eol,start
set ttyfast
set encoding=utf-8 nobomb

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=syntax   " Other acceptable values are marker, manual, expr, syntax, diff.

set nowrap
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set cursorline
set scrolloff=3
set nostartofline

set list
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=nbsp:_

set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set viminfo=$HOME/.vim/viminfo

set shell=/bin/bash

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

" jsx highlighting in js files
let g:jsx_ext_required = 0

let g:ackprg = 'ag --nogroup --nocolor --column'
"
" open ag.vim
nnoremap <leader>a :Ag

" save session
nnoremap <leader>s :mksession<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp ~/vimrc<CR>
nnoremap <leader>ez :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" space open/closes folds
nnoremap <space> za

nnoremap <C-p> :Files<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" strip whitespace
noremap <leader>$ :call StripTrailingWhitespace()<CR>

" auto indent file
map <Leader>i mmgg=G'm<CR>

" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" airline config
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" Use syntastic passive mode for html since hints are mostly bogus
let syntastic_mode_map = { 'passive_filetypes': ['html'] }