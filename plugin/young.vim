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

" [](https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript)
function! VirtualSelection()
  try
    let a_save = @a
    normal! "ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

" The following example lists user names to a Finger command >
" com -complete=custom,ListUsers -nargs=1 Finger !finger <args>
" fun ListUsers(A,L,P)
"     return system("cut -d: -f1 /etc/passwd")
" endfun

" The following example completes filenames from the directories specified in the 'path' option: >
" com -nargs=1 -bang -complete=customlist,EditFileComplete
"  \ EditFile edit<bang> <args>
" fun EditFileComplete(A,L,P)
"     return split(globpath(&path, a:A), "\n")
" endfun

" command! -nargs=1 -range=% SaveIt :<line1>,<line2>write! <args>

" command! -nargs=+ -complete=expression Test :echo "<args>"

" command! -nargs=* -complete=packadd RR lua rr(<f-args>)
command! -nargs=* -complete=customlist,v:lua.require'tools'.rr_complete RR lua require'tools'.rr(<f-args>)

" Replace a range with the contents of a file
com -range -nargs=1 -complete=file Replace <line1>-pu_|<line1>,<line2>d|r <args>|<line1>d

" Count the number of lines in the range
com! -range -nargs=0 Lines  echo <line2> - <line1> + 1 "lines"


