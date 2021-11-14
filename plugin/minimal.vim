function! Cap(cmd)
  execute ":enew|pu=execute('" . a:cmd . "')|1,2d_"
endfunction
command! -nargs=+ -complete=command Cap silent call Cap(<q-args>)
