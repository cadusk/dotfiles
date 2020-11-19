" Turn off scrollbars. (Default on macOS is "egmrL").
if has('gui')
  set guioptions-=L
  set guioptions-=R
  set guioptions-=b
  set guioptions-=l
  set guioptions-=r

  set guifont=Source\ Code\ Pro\ Light:h13
  set guioptions-=T                     " don't show toolbar
endif
