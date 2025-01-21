" The following was an attempt to use netrw as an improved base.
" It...could work, but if I want some git status, icons, it is a lot of hassle.
"
" Deactivate netrw, see :h netrw-noload
"let g:loaded_netrw       = 1
"let g:loaded_netrwPlugin = 1
"" Prevent further settings
"finish


" Look:
let g:netrw_banner = 0		" remove header
let g:netrw_liststyle = 3	" tree like listing
let g:netrw_fastbrowse = 0	" always re-read directories content
let g:netrw_browse_split = 4	" open in previous buffer
" let g:netrw_winsize = 30	" uses a percentage, which we don't want
let g:netrw_list_hide = &wildignore
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" ChatGPT's attempt to open netrw at the current file cursor's position
"function! OpenNetrwWithCurrentFile()
"  " Get the current file path and the file name
"  let file_name = expand('%:t')
"  " Open netrw in the left pane, at the current file's directory
"  execute '20Explore ' . expand('%:p:h')
"  " Wait for netrw to load completely (important for the contents to render)
"  redraw!
"  " Now, use the netrw buffer's features to navigate directly to the file
"  " We're using a method based on cursor positioning:
"  " Move the cursor to the appropriate position (the current file in the list)
"  execute 'normal! /' . file_name . "\<CR>"
"endfunction
"nnoremap <leader>e :call OpenNetrwWithCurrentFile()<CR>

function! NetrwToggle()
	if !bufexists('NetrwTreeListing')
		"20 is a percentage
		:20Lexplore %:p:h
	else
		" suppose Lexplore == <C-w> h
		:wincmd h
	endif
endfunction
nnoremap <silent> <leader><TAB> :call NetrwToggle()<CR>

function! NetrwMapping()
  " fix: do not replace my current 'text file' buffer with netrw content
  nnoremap <buffer> <C-l> <C-W>l
  " refresh with Ctrl R (looses the cursor position)
  nnoremap <buffer> <c-r> :e .<cr>

  " vim is being opened with a folder as an argument:
  " once the file opened, this needs to be deleted, see the last instruction.
  if tabpagenr() == 1 && tabpagewinnr(1, '$') == 1 && bufname() == "NetrwTreeListing"
	" :wincmd h
	" :20Lexplore
	" :wincmd l
	" :enew
	" " Problem here: maybe Enter can occur on a directory
	" nnoremap <buffer><silent> <CR>	<Plug>NetrwLocalBrowseCheck<BAR>:bw#<CR>
  endif

  " switch to the previous window (since we probably used leader+Tab to jump)
  nnoremap <buffer> <C-^> <C-w>p

  " go above and below a directory
  " TODO: better 'h' user experience
  " nnoremap <buffer> h <Plug>NetrwBrowseUpDir
  " nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck<BAR>zz
  " try to bind leftclick to behave normally...
  " nnoremap <buffer> <LeftMouse> <Plug>NetrwLocalBrowseCheck

  " close the tree if already focused
  nnoremap <buffer><silent> <leader><TAB> :bw!<CR>
endfunction

" https://www.reddit.com/r/neovim/comments/jr5zdb/remapping_keys_in_netrw/
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
