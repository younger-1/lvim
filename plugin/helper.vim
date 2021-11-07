function! LocListToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    silent! lopen
  else
    lclose
  endif
endfunction

function! OpenLastClosed()
    let last_buf = bufname('#')

    if empty(last_buf)
        echo "No recently closed buffer found"
        return
    endif
    let result = input("Open ". last_buf . " in (n)ormal (v)split, (t)ab or (s)plit ? (n/v/t/s) : ")
    if empty(result) || (result !=# 'v' && result !=# 't' && result !=# 's' && result !=# 'n')
        return
    endif
    if result ==# 't'
        execute 'tabnew'
    elseif result ==# 'v'
        execute "vsplit"
    elseif result ==# 's'
        execute "split"
    endif
    execute 'e ' . last_buf
endfunction


function! FoldTextToggle()
  if &foldtext == "foldtext()"
    set foldtext=fold#Text()
  else
    set foldtext=foldtext()
  endif
endfunction

" command! -nargs=* -complete=packadd RR lua rr(<f-args>)
command! -nargs=* -complete=customlist,v:lua.require'user.tools'.rr_complete RR lua require'user.tools'.rr(<f-args>)

" Replace a range with the contents of a file
com -range -nargs=1 -complete=file Replace <line1>-pu_|<line1>,<line2>d|r <args>|<line1>d

" Count the number of lines in the range
com! -range -nargs=0 Lines  echo <line2> - <line1> + 1 "lines"

" Open in VSCode from Vim
command! OpenInVSCode exe '!code --goto "' . expand('%') . ':' . line('.') . ':' . col('.') . '"' | redraw!
" Open in VSCode from Vim and preserve the working directory
command! OpenCwdInVSCode exe 'silent !code "' . getcwd() . '" --goto "' . expand('%') . ':' . line('.') . ':' . col('.') . '"' | redraw!

function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "This command do NOT have output"
  else
    " Use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
