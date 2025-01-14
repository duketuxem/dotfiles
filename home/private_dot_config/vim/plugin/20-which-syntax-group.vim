" Discover the syntax group name for the word under the cursor.
" Really helpful to write a colorscheme.
" Wrapper of the synstack native vim function.

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <F12> :call g:SynStack()<CR>
