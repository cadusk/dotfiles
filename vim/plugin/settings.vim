set nobackup                          " disable backup files
set noswapfile                        " disable swap files
set undofile                          " disable undo files

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

" Highlight up to 255 columns (this is the current Vim max) beyond 'textwidth'
if exists('+colorcolumn')
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set cursorline                        " highlight current line
" set diffopt+=foldcolumn:0             " don't show fold column in diff view
" set diffopt+=iwhite,vertical

set noemoji                           " don't assume all emoji are double width
set expandtab                         " always use spaces instead of tabs

if has('folding')
  if has('windows')
    set fillchars=diff:∙               " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·              " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    set fillchars+=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif

  if has('nvim-0.3.1')
    set fillchars+=eob:\              " suppress ~ at EndOfBuffer
  endif

  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif

set formatoptions+=n                  " smart auto-indenting inside numbered lists
set hidden                            " allows you to hide buffers with unsaved changes without being prompted

set laststatus=2                      " always show status line
set lazyredraw                        " don't bother updating screen during macro playback

if has('linebreak')
  set linebreak                       " wrap long lines at characters in 'breakat'
  let &showbreak='↳ '                 " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

set list
set listchars=nbsp:␣
set listchars+=tab:→\ 
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•

set number                            " show line numbers in gutter
if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif

set noshowmode                        " don't show insert/normal/cmd mode. this is going to be taken care by lightline
set modeline
set modelines=5                       " scan this many lines looking for modeline
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set shell=sh                          " shell to use for `!`, `:!`, `system()` etc.
set noshiftround                      " don't always indent by multiple of shiftwidth
set shiftwidth=2                      " spaces per tab (when shifting)

set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
if has('patch-7.4.314')
  set shortmess+=c                    " completion messages
endif
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set sidescroll=0                      " sidescroll in jumps because terminals are slow
set sidescrolloff=3                   " same as scrolloff, but for columns
set smarttab                          " <tab>/<BS> indent/dedent in leading whitespace

if has('showcmd')
  set noshowcmd                       " don't show extra info at end of command line
endif

if has('syntax')
  set synmaxcol=200                   " don't bother syntax highlighting long lines
endif

set tabstop=2                         " spaces per tab
set textwidth=80                      " automatically hard wrap at 80 columns

if has('mksession')
  set viewdir=~/.vim/tmp/view         " override ~/.vim/view default
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif
set visualbell t_vb=                  " stop annoying beeping for non-error errors
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries

set wildcharm=<C-z>                   " substitute for 'wildchar' (<Tab>) in macros
if has('wildignore')
  set wildignore+=*.o,*.rej           " patterns to ignore during file-navigation
  set wildignore+=*/.git/**,*/.hg/**,*/.svn/**
  set wildignore+=*/__pycache__/*,*/*.pyc,*/*.pyo
  set wildignore+=*/node_modules/**
endif
if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

set showmatch

set ignorecase                        " ensure search ignores case
set smartcase                         " make sure search ignores case even if search term is typed with uppercase letters
