set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'

call plug#end()

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set nobackup
set noswapfile
set undofile
set hidden

set termencoding=utf-8
set encoding=utf-8
set textwidth=79
set wrapmargin=80
set colorcolumn=80
set formatoptions=qrn1
set diffopt+=iwhite,vertical
set shortmess+=afilmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
let &showbreak='++ '

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

let mapleader=','
let g:mapleader=','

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~
set wildignore+=*/tmp/*,*/venv/*,*.pyc,*.pyo,*.sqlite3
set suffixes+=*.pyc,*.pyo,*~

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" navigate over wrapped lines as if they were separeted lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

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
nnoremap <leader>h <C-w>s

" split resizing
nnoremap <C-S-Left> <c-w><
nnoremap <C-S-Right> <c-w>>
nnoremap <C-S-Up> <c-w>-
nnoremap <C-S-Down> <c-w>+

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Expand/Collapse foldings using space
nnoremap <space> za

vnoremap <leader>s :sort<cr> "sort selection lines
nnoremap <leader>/ :noh<cr> " clear out search highlights
nnoremap <leader>a :let &scrolloff=999-&scrolloff<cr> " toggle 'keep current line in the center of the screen' mode

" underline current line
nnoremap <leader>= yypVr=
nnoremap <leader>- yypVr-

" clean trailing whitespace
nnoremap <leader>x mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" hardwrap text paragraphs
nnoremap <leader>q gqip

" select just pasted text
nnoremap <leader>V V`]

" folding
set foldmethod=marker
set foldlevel=1
set foldnestmax=2

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" --------------- CtrlP --------------
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn|venv)$'

set background=dark
let g:gruvbox_contrast_light=1
colorscheme gruvbox

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

syntax on
