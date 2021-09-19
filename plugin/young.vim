function! LocListToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    lopen
  else
    lclose
  endif
endfunction

