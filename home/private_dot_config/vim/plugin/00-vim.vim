" Vim:
" turn off increase/decrease numbers to avoid mistakes, prefer :h v_g_CTRL-a
map <C-a> <Nop>
map <C-x> <Nop>

" consistent mapping from other vim basic motions
nnoremap Y y$

" ignore a text to replace from being recorded into registers
nnoremap c "_c

" TOFIX: is this working ? perform dot commands over visual blocks:
vnoremap . :normal .<CR>

nnoremap <leader>x :cd %:h<CR>

augroup onVimEnterRestoreSessionIfAny
	autocmd!
	function! RestoreSess()
		" [Gvim specific]
		" do not restore the session if v:servername contains numbers.
		" if so, it means an existing vim instance is running, but the
		" goal is to have a fresh one started, not a mirrored instance
		if filereadable(expand("~/Session.vim")) && v:servername !~ '\d'
			source ~/Session.vim
		endif
	endfunction

	" TODO: document precisely why this was needed
	" :h automcmd-nested
	autocmd VimEnter * nested call RestoreSess()
augroup END

" Tell vim to remember certain things when we exit
"  '10   :  marks will be remembered for up to 10 previously edited files
"  "1000 :  will save up to 1000 lines for each register
"  :20   :  up to 20 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list | off - (use sessions if needed)
"  h     :  disable the effect of 'hlsearch'
"  n...  :  where to save the viminfo files | viminfofile set in xdg.vim
set viminfo='10,\"1000,:20,h
