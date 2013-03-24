nnoremap <leader>g :silent set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<C-U>call <SID>GrepOperator(visualmode())<cr>
function! s:GrepOperator(type)
  let reg = @@
  if a:type ==# "v"
    execute "normal! `<v`>y"
  elseif a:type ==# "V"
    execute "normal! `[v`]y"
  else
    return
  endif

  silent execute "grep! -R ". shellescape(@@) . " ."
  copen

  let @@ = reg
endfunction

















