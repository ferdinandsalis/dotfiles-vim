" Ferdinand Salis
" -----------------------------------------------------------------------------

" must be first as may impact options below
set nocompatible

" Plugins
" -----------------------------------------------------------------------------

" download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'avakhov/vim-yaml'

Plug 'w0rp/ale'
let g:ale_completion_enabled = 0
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let b:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_eslint_use_global = 1

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/pgsql.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'mhinz/vim-grepper'
Plug 'jparise/vim-graphql'
Plug 'dag/vim-fish'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_extensions = []
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='solarized'

Plug 'edkolev/tmuxline.vim'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_command_aliases = 1

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
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

highlight Comment cterm=italic

set visualbell
set mouse=a
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
set shell=/usr/local/bin/fish
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set hidden

if !empty(&viminfo)
  set viminfo^=!
endif

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
endif

" sql syntax highlighting
let g:sql_type_default = 'pgsql'

" leader
let mapleader = ' '
let maplocalleader = ' '

let g:ackprg = 'ag --nogroup --nocolor --column -a'
nnoremap <leader>n :nohlsearch<CR>
" paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" jsx
let g:jsx_ext_required = 0

" statusline
" -----------------------------------------------------------------------------

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'
  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" nerdtree
" -----------------------------------------------------------------------------
map <c-n> :NERDTreeToggle<CR>

" fzf
" -----------------------------------------------------------------------------
nnoremap <silent> <leader><leader> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

