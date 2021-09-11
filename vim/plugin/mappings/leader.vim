"
" Leader mappings
"

let mapleader=" "
"let maplocalleader="\\ "

" open last buffer
nnoremap <leader><leader> <C-^>

" remove trailing spaces
nnoremap <silent> <leader>z :FixWhitespace<CR>

" invoke fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" last typed word to lowercase/uppercase
nnoremap <leader>u guaw
nnoremap <leader>U gUaw

" split current window
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s
" close current split
nnoremap <leader>c <C-w>c

" make select window the only one
nnoremap <silent> <leader>o :only<CR>

" zoom a vim pane
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" life saving mappings
vnoremap <leader>s :sort<CR>
nnoremap <leader>/ :let @/=''<CR>

" fix formatting inside paragraph
nnoremap <leader>q gqip

" underline a line
nnoremap <leader>_ yypVr-

" leader+y copies to OS clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" <leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <leader>r :call cardoc#mappings#leader#cycle_numbering()<CR>


