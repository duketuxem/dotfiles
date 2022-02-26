" To be improved...
"
" coderwall.com  automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode

let &t_SI .= "\<Esc>[?2004h"  " Start Insert mode
let &t_EI .= "\<Esc>[?2004l"  " End Insert (or Replace) mode

function! NoIndentPaste()
  set pastetoggle=<Esc>[201~  " Turn 'paste' on and off with one keypress
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ NoIndentPaste()
