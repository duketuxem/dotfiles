" Bro: A searchable :bro old
" TODO: Document here

function! Bro()
	" only window opened and empty buffer ?
	if expand('%:p') == ''
		" then replace it with the oldfiles list
		:enew | silent 0put =v:oldfiles | 1

		" open the selected entry (file) replacing the current buffer
		:nnoremap <buffer> <CR>
					\ :e <C-r>=getline('.')<CR><CR>
					\ :bw!#<CR>
		" todo: <silent> is to hide the last command execution
	else
		" create a new window with the recent files opened
		:new +setl\ buftype=nofile | silent 0put =v:oldfiles

		" ensure it is always at the bottom,
		" tiny and that the cursor is on the first line
		:wincmd J | resize 10

		" open the selected file on enter
		" wipe the previous buffer with recent files
		" remember the buffer number and close the tiny window
		" replace the previous window content with the opened file
		:nnoremap <silent> <buffer> <CR>
					\ :e <C-r>=getline('.')<CR><CR>
					\ :bw!#<CR>
					\ :let t:remember_buff=bufnr()<CR>
					\ :close<CR>
					\ :exe "buffer ".t:remember_buff<CR>
					\ :unlet t:remember_buff<CR>
	endif
endfunction

" Add ':Bro' to cmdline
command! Bro call Bro()
" map leader r to :Bro
nnoremap <silent> <leader>r :Bro<CR><CR>
" replace :bro with :Bro
cnoreabbrev <expr> bro (getcmdtype() ==# ':' && getcmdline() ==# 'bro')
			\ ? 'Bro' : 'bro'
