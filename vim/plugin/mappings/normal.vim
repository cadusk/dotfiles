
" easy navigation of looong lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" prevent entering ex mode accidentally
nnoremap Q <nop>

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Store relative line number jumps in the jumplist if they exceed a threshold.
" This will ignore short moves and keep them from poluting jump list.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

