" Ferdinand Salis
" * mostly copied from junegunn and others
" -----------------------------------------------------------------------------

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimrc
  autocmd!
augroup END

let mapleader = ' '
let maplocalleader = ' '

" ============================================================================
" PLUGINS {{{
" ============================================================================

packadd minpac
call minpac#init()

" # Browsing & search
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('tpope/vim-vinegar')
call minpac#add('scrooloose/nerdtree', { 'on': 'NERDTreeToggle' })
call minpac#add('Yggdroot/indentLine', { 'on': 'IndentLinesEnable' })
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('edkolev/tmuxline.vim')
" # Git
call minpac#add('tpope/vim-fugitive') " Stage, commit all from within vim
call minpac#add('tpope/vim-rhubarb') " Github extension for vim fugitive
call minpac#add('mhinz/vim-signify') " Show diff from git in sign column
call minpac#add('junegunn/gv.vim') " Git browser
" # Syntax
call minpac#add('pangloss/vim-javascript')
" call minpac#add('HerringtonDarkholme/yats.vim')
" call minpac#add('leafgarland/typescript-vim')
" call minpac#add('maxmellon/vim-jsx-pretty')
" call minpac#add('jxnblk/vim-mdx-js')
call minpac#add('elixir-editors/vim-elixir', { 'for': 'elixir' })
call minpac#add('avakhov/vim-yaml', { 'for': 'yaml' })
call minpac#add('jparise/vim-graphql')
call minpac#add('lifepillar/pgsql.vim', {'for': 'sql' })
call minpac#add('dag/vim-fish')
" # Make, linter, test & more
call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })
" # Theme, colors, etc.
call minpac#add('morhetz/gruvbox')
call minpac#add('lifepillar/vim-solarized8')
call minpac#add('lokaltog/vim-monotone')
" # Editing
call minpac#add('junegunn/goyo.vim')
call minpac#add('junegunn/limelight.vim')
call minpac#add('junegunn/rainbow_parentheses.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-tbone')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('plasticboy/vim-markdown')

" 'tpope/vim-dispatch'
" 'janko/vim-test'
" 'junegunn/heytmux', { 'do': 'gem install heytmux' } " tmux scripting
" 'tpope/vim-projectionist'
" 'mbbill/undotree'
" 'jelera/vim-javascript-syntax'
" 'yuezk/vim-js'
" 'othree/yajs.vim'
" 'peitalin/vim-jsx-typescript'
" 'mxw/vim-jsx'

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}} Plugins

" ============================================================================
" General {{{
" ============================================================================

set hidden
set encoding=utf-8
set nobomb
set ttimeout
set ttimeoutlen=100
set visualbell
set clipboard=unnamed
set mouse=a
set mousehide
set showcmd
set showtabline=2
set laststatus=2
set noshowmode
set tabpagemax=10
set pumheight=15
set wildmenu
set wildmode=full
set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
set hlsearch
set incsearch
set ignorecase
set backspace=indent,eol,start
set lazyredraw
set showmatch
set showbreak=↪
set breakindent
set breakindentopt=sbr
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=marker
set nostartofline " keep cursor on same line
set shell=/usr/local/bin/fish
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set cmdheight=2 " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set synmaxcol=300
set shortmess+=c
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set background=dark
set re=1

set title
set smarttab
set smartcase
set noruler
set autoindent
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set relativenumber
set nocursorline
set nocursorcolumn
set signcolumn=yes
set scrolloff=5 " Show at least five lines when scrolling
set sidescrolloff=5 " Ditto, but for horizontal scrolling
set display=lastline
set wrap

if !empty(&viminfo)
  set viminfo^=!
endif

set undofile
if !has('nvim')
  set undodir=~/.vim/undo
endif

augroup vimrc
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" True color support
" https://jdhao.github.io/2018/10/19/tmux_nvim_true_color/
if has('termguicolors')
  let &t_8f = "\<esc>[38;2;%lu;%lu;%lum" " needed in tmux
  let &t_8b = "\<esc>[48;2;%lu;%lu;%lum" " ditto
  set termguicolors
endif

let g:gruvbox_italic=1

colorscheme gruvbox

" }}} General

" ============================================================================
" MAPPINGS
" ============================================================================

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap <silent> <space>n :NERDTreeToggle<CR>

" <leader>m | stop highlighting search
nnoremap <leader>m :nohlsearch<CR>

" U | toggle undotree window
nnoremap U :UndotreeToggle<CR>

" <leader>p | paste from system register
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" TODO: better window navigation

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" vim-commentary
" ----------------------------------------------------------------------------
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------
nmap     <Leader>g :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>

" ----------------------------------------------------------------------------
" vim-test
" ----------------------------------------------------------------------------
nmap <silent> t<C-f> :TestFile<CR>

" ----------------------------------------------------------------------------
" buftabline
" ----------------------------------------------------------------------------
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt


" ============================================================================
" FUNCTIONS & COMMANDS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" :Root | Change directory to the root of the Git repository
" ----------------------------------------------------------------------------
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

" ----------------------------------------------------------------------------
" :AutoSave | Automatically save changes
" ----------------------------------------------------------------------------
function! s:autosave(enable)
  augroup autosave
    autocmd!
    if a:enable
      autocmd TextChanged,InsertLeave <buffer>
            \  if empty(&buftype) && !empty(bufname(''))
            \|   silent! update
            \| endif
    endif
  augroup END
endfunction

command! -bang AutoSave call s:autosave(<bang>1)

" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

" ----------------------------------------------------------------------------
" <Leader>z | Zoom (Focus on current buffer)
" ----------------------------------------------------------------------------
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" }}} FUNCTIONS & COMMANDS

" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

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

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>L :Lines<CR>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <silent> <Leader>C :Colors<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" }}}


" ============================================================================
" AUTOCMD
" ============================================================================

augroup vimrc
  " Automatic rename of tmux window
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown set textwidth=80 wrap lbr
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ============================================================================
" COC {{{
" ============================================================================

let $NODE_CLIENT_LOG_LEVEL = 'debug'
let g:node_client_debug = 1
let g:coc_global_extensions = []
let g:coc_watch_extensions = []
let g:coc_node_path = '/usr/local/bin/node'

" use tab for completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent! call CocActionAsync('highlight')
autocmd User CocQuickfixChange :CocList --normal quickfix
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}

" Netrw {{
  let g:netrw_liststyle=3
" let g:netrw_chgwin = 2
" let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_winsize=20
" let g:netrw_localrmdir='rmtrash'
" let g:netrw_bufsettings = "noma nomod nonu nobl nowrap ro nornu buftype=nofile"
" }}

let g:ackprg = 'ag --nogroup --nocolor --column -a' " vim-ack
" let g:jsx_ext_required = 0 "vim-jsx
let g:signify_vcs_list = ['git'] " vim-signify
let g:sql_type_default = 'pgsql' " pgsql.vim

augroup aug_nerd_tree
  au!

  " Auto launch tree when vim is run with directory as argument
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " Exit vim when the only buffer remaining is NerdTree
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Use arrow keys to navigate
  autocmd FileType nerdtree nmap <buffer> l o
  autocmd FileType nerdtree nmap <buffer> L O
  autocmd FileType nerdtree nmap <buffer> h p
  autocmd FileType nerdtree nmap <buffer> H P

  " Disable cursorline in NERDtree to avoid lags
  " built-in g:NERDTreeHighlightCursorline does not work
  autocmd FileType nerdtree setlocal nocursorline
augroup END

let NERDTreeQuitOnOpen=1
"autocmd BufReadPre,FileReadPre * :NERDTreeClose
" Sort files with numbers naturally
let NERDTreeNaturalSort=1
" Show hidden files by default
let NERDTreeShowHidden=1
" Minimal UI, do not show bookmarks and help blocks
let NERDTreeMinimalUI=1
" Increase tree explorer split a bit (default is 31)
let NERDTreeWinSize=40
" Automatically delete buffer when file is deleted from the tree explorer
let NERDTreeAutoDeleteBuffer=1
" Do not show '.git' directories, in addition to what specified in .gitignore
let NERDTreeIgnore=['\~$', '^\.git$[[dir]]']

" Plugin: ryanoasis/vim-devicons {{{
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''

" From FAQ: How do I solve issues after re-sourcing my vimrc?
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
" }}}

" Plugin: indentLine {{{
autocmd! User indentLine doautocmd indentLine Syntax
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3c3836'
" }}}

" Plugin: indentLine {{{
let g:gruvbox_bold=0
let g:gruvbox_invert_selection=0
" }}}

" Plugin: airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" }}}

" source current buffer
noremap <silent><buffer> <F9> :exec 'source '.bufname('%')<CR>

" spellcheck for git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Rendering performance in iterm2 https://gitlab.com/gnachman/iterm2/-/wikis/Metal-Renderer
"
tnoremap <Esc> <C-\><C-n>
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

augroup terminal
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
augroup END
