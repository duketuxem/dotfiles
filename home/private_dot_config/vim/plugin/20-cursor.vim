" Cursor: Keep centered when...
" scrolling up/down
nnoremap <expr> <C-d>    line('.') == 1 ? 'M' : '<C-d>zz'
nnoremap <C-u>  <C-u>zz
" going to the next/prev location
nnoremap <C-i>  <C-i>zzzv
nnoremap <C-o>  <C-o>zzzv
" going to a tag (land in a centered window)
nnoremap <C-]> <C-]>zzzv
" searching
nnoremap n nzzzv
nnoremap N Nzzzv
" joining
nnoremap J mzJ`z
" scrolling horizontally
nnoremap zl zL
nnoremap zh zH
" TODO: Be sure that this centers screen when jumping to marks
nnoremap <expr> ' "'" . nr2char(getchar()) . "zz"
nnoremap <expr> ` "`" . nr2char(getchar()) . "zz"
" TODO: when searching

" Todo: a cursor plugin ? fix the <C-o> which does not remember cursor
" automatically restore the previous cursor position
" keywords: - vim.fandom.com
"           - restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
  if line("'\"") > 1 && line("'\"") <= line("$")
    if foldclosed(line("'\"")) < 0
      silent normal! g`"zz
    else
      silent normal! g`"zozz
    endif
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
