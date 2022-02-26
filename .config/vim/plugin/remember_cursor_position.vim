" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
" ----- Don't forget to mkdir $XDG_STATE_HOME/vim before -----
"if !isdirectory("$")
"    call mkdir("/my/directory", "p")
"endif
set viminfo='10,\"100,:20,%,n$XDG_STATE_HOME/vim/viminfo

" Afterwards, add the main function that restores the cursor position and
" its autocmd so that it gets triggered:
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" keywords: - vim.fandom.com
"           - restore_cursor_to_file_position_in_previous_editing_session
