""" Manages how terminal emulators are behaving when running Vim

" TODO: Put all the specificites for terminals here

" Parent process
set title
set titlestring=Vim

" explicit mappings to avoid weird behavior on some terminal emulators
" example: urxvt and st have some trouble dealing 'natively'
" with Ctrl/Alt + Left/Right while others (kitty, xterm) handle it smoothly
" Better to set it anyway.

" gvim ? does not work in term :)
" inoremap <C-Del> <C-o>dW

" if &term =~ "^st"
" endif

" if &term =~ "^xterm"
" endif

" Ctrl
" nmap <ESC>[1;5D <C-Left>
" nmap <ESC>[1;5C <C-Right>
" cmap <ESC>[1;5D <C-Left>
" cmap <ESC>[1;5C <C-Right>
" imap <ESC>[1;5D <C-o><C-Left>
" imap <ESC>[1;5C <C-o><C-Right>
" " Alt
" nmap <ESC>[1;3D <Nop>
" nmap <ESC>[1;3C <Nop>
" cmap <ESC>[1;3D <Nop>
" cmap <ESC>[1;3C <Nop>
" imap <ESC>[1;3D <Nop>
" imap <ESC>[1;3C <Nop>
