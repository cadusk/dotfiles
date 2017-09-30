" NeoBundle scripts --------------------------------
if has('vim_starting')
	set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
	set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.config/nvim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim
	let g:not_finish_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'morhetz/gruvbox'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'fatih/vim-go'
"
" CtrlP configuration -------------------------------
let g:ctrlp_map = '<leader>e'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_dotfiles = 0
let g:ctrlp_custom_ignore = {
	\ 'files': '\.py[oc]$',
	\ 'venvs': '\v[\/]venv$',
	\ 'rcs': '\v[\/]\.(git|hg|svn|vs)$'
	\ }

NeoBundle 'vim-scripts/ctrlp.vim'

call neobundle#end()
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" End NeoBundle scripts --------------------------------

" environment directory setup
silent execute '!mkdir -p ~/.config/nvim/tmp/{view,undo}'
set nobackup
set noswapfile
set viewdir=$HOME/.config/nvim/tmp/view/
set undodir=$HOME/.config/nvim/tmp/undo/
set undofile
set viminfo='50,n$HOME/.config/nvim/tmp/viminfo

" editing
set hidden
set textwidth=79
set wrapmargin=80
set formatoptions-=o
set diffopt+=iwhite,vertical
set visualbell
set number
set noerrorbells
set cursorline
set colorcolumn=80
set showtabline=2
set showcmd
set showmatch
set noshowmode
set modeline
set viewoptions=folds,options,cursor,unix,slash
set splitright splitbelow
set mouse-=a
let &showbreak = '++ '

" searching
set hlsearch
set ignorecase
set smartcase

" lists and menus
set wildmode=list:longest,full
set wildignore+=*/tmp/,*/venv/*,*/.pyc,*.pyo,*~
set suffixes+=*.pyc,*.pyo,*~

" formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F2>

" time out on key codes but no mappings
" this makes terminal vim work sanely
set notimeout
if !has('nvim') && &ttimeoutlen == -1
    set ttimeout
    set ttimeoutlen=100
endif

" visuals
set background=dark
colorscheme gruvbox

" mappings
let mapleader=','

" visual shifting
vnoremap < <gv
vnoremap > >gv

" navigate over wrapped lines as if they were separated lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" there are other vim ways of moving around
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
inoremap <PageUp> <NOP>
inoremap <PageDown> <NOP>
vnoremap <PageUp> <NOP>
vnoremap <PageDown> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
vnoremap <UP> <NOP>
vnoremap <DOWN> <NOP>
vnoremap <LEFT> <NOP>
vnoremap <RIGHT> <NOP>

" split current window
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>h

" split resizing
nnoremap <C-S-Left> <C-w><
nnoremap <C-S-Right> <C-w>>
nnoremap <C-S-Up> <C-w>-
nnoremap <C-S-Down> <C-w>+

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" expand/collapse foldings using space
nnoremap <space> za

" util commands
vnoremap <leader>s :sort<CR>    " sort selected lines
nnoremap <leader>/ :noh<CR>     " clear out search highlights
nnoremap <leader>a :let &scrolloff=999-&scrolloff<CR>   " toggles mode to keep current line in the center of the screen

" buffer listing using CtrlP plugin
nnoremap <leader>t :CtrlPBuffer<CR>

" underline current line
nnoremap <leader>= yypVr=
nnoremap <leader>- yypVr-

" clear trailing whitespaces
nnoremap <leader>x mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" hardwrap text paragraphs
nnoremap <leader>q gqip

" reselect just pasted text
nnoremap <leader>V V`]


