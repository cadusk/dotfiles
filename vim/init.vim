" Influences creating this configuration structure:
" - https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen
" - https://github.com/wincent/wincent/tree/master/aspects/vim/files/.vim/
" - https://dougblack.io/words/a-good-vimrc.html

let mapleader=" "
"let maplocalleader="\\ "

" figure out configuration folders for this system
if has('nvim')
  let myConfigDir=expand('$HOME/.config/nvim')
else
  let myConfigDir=expand('$HOME/.vim')
endif

" Avoid search, speeding up start-up.
if filereadable('/usr/bin/python3')
  let g:python3_host_prog='/usr/bin/python3'
endif

let s:vimrc_local=myConfigDir . 'vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

silent execute '!mkdir -p ' . myConfigDir . '/tmp/{view,undo}'
let &viewdir=expand(myConfigDir . '/tmp/view/')
let &undodir=expand(myConfigDir . '/tmp/undo/')
if !has('nvim')
  let &viminfofile=expand(myConfigDir . '/tmp/viminfo')
endif

" Prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcomment_mapleader1=''
" The default (g<) is a bit awkward to type.
let g:tcomment_mapleader_uncomment_anyway='gu'
let g:tcomment_textobject_inlinecomment=''

" Fzf configuration
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
let g:netrw_altv = 1

let g:undotree_HighlightChangedText=0
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=2
let g:undotree_DiffCommand='diff -u'

let g:go_version_warning = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_auto_sameids = 1
let g:go_highlight_build_contraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" auto-install vim-plug
let vim_plug_location = expand(myConfigDir . '/autoload/plug.vim')
if !filereadable(vim_plug_location)
  echo "Installing VimPlug..."
  echo ""
  silent execute '!curl -fLo ' . myConfigDir . '/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let g:plug_just_installed = "yes"
endif

" minimalist plug-in management
" if you don't know how to install, check out this page:
" https://github.com/junegunn/vim-plug
call plug#begin(expand(myConfigDir . '/plugged'))
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'adelarsq/vim-matchit'
Plug 'godlygeek/tabular'
Plug 'leshill/vim-json'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
call plug#end()

if exists('g:plug_just_installed')
  :PlugInstall!
endif

" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
"
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype indent plugin on
syntax on
