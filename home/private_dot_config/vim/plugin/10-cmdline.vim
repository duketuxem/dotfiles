" remap colon to semicolon, game changer...
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Completion_menu:
set wildmenu	" do not spam TAB in command line
set wildmode=list:longest,list:lastused,list:full
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.pyc,*.flv,*.img
set wildchar=<Tab>	" explicit setting: default in vim, <C-e> in Vi
set wildcharm=<Tab>	" recognize tab as completer command in mappings

" arrow up/down in :cmdline
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

" Help:
function! GetHelpOnCwordOnRight()
	if &filetype == "vim"
		execute 'vert help ' . expand("<cword>")
	else
		" To improve if needed
		execute 'vert silent read ! ' . &keywordprg . ' ' . expand("<cword>")
	endif
endfunction
nnoremap K :call GetHelpOnCwordOnRight()<CR>

" open help on the right
cnoreabbrev h vert h


" Terminal: The builtin :term inside of vim (will shift in favor of tmux)
" rebind escape to avoid <C-w><S-N>
" (or was it C-n like in the following mapping) ?
tnoremap <C-[> <c-\><c-n>
" impossible on MS-Windows -> :h scroll-mouse-wheel
tnoremap <ScrollWheelUp> <C-\><C-n><C-u>
tnoremap <ScrollWheelDown> <C-d>

