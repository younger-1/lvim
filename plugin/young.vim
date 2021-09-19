function! LocListToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    silent! lopen
  else
    lclose
  endif
endfunction

" [](https://vi.stackexchange.com/questions/3388/call-a-vim-function-silently)
function! FirstCharOrFirstCol()
  let current_col = virtcol('.')
  normal ^
  let first_char = virtcol('.')
  if current_col == first_char
    normal 0
  endif
endfunction
