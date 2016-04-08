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
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
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

set backspace=indent,eol,start
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
set shell=/bin/bash
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
syntax on

if !empty(&viminfo)
  set viminfo^=!
endif

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

let mapleader=","                 " leader is comma
let g:airline_theme = 'solarized' " airline theme
let g:airline_powerline_fonts = 1 " airline config
let g:jsx_ext_required = 0        " jsx highlighting in js files
let g:ackprg = 'ag --nogroup --nocolor --column'
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" fuzzy file finder
nnoremap <C-p> :Files<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>
