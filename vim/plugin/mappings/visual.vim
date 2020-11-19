"
" Visual mode mappings
"

" move lines up and down in visual mode
xnoremap <c-k> :move '<-2<CR>gv=gv
xnoremap <c-j> :move '>+1<CR>gv=gv

" visual block shifting
vnoremap < <gv
vnoremap > >gv

