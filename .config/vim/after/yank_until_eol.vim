" In this case, I usually map Y to be |y$|, which makes it consistent with
" the |D| and |C| operators.  The way yankring_n_keys works does not allow
" me to customize this behaviour.  Since many people may like to customize
" the behaviour of these maps the YankRing will check to see if a
" function called YRRunAfterMaps() exists.  If it does, it will call
" this function after it has created the maps.  So in my case, I created
" the following function in my |vimrc|: >
"
"     function! YRRunAfterMaps()
"         nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
"     endfunction
"
" <
" You can do anything you need in this function.  >
"         nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
" <
" This line remaps Y (which the user presses) to the YRYankCount command.  The
" YRYankCount tells Vim to execute y$ instead.

" Source:
" https://github.com/vim-scripts/YankRing.vim/blob/master/doc/yankring.txt#L519


" Remap Y to y$
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
