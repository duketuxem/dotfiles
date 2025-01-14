" look:
let g:netrw_banner = 0		" remove header
let g:netrw_liststyle = 3	" tree like listing
let g:netrw_fastbrowse = 0	" always re-read directories content
let g:netrw_browse_split = 4	" open in previous buffer
" let g:netrw_winsize = 30	" uses a percentage, which we don't want
let g:netrw_list_hide = &wildignore
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

function! NetrwOpenReopen()
	if !bufexists('NetrwTreeListing')
		" 20 is a percentage
		:20Lexplore %:p:h
	else
		" suppose Lexplore == <C-w> h
		:wincmd h
	endif
endfunction

nnoremap <silent> <leader><TAB> :call NetrwOpenReopen()<CR>

" https://www.reddit.com/r/neovim/comments/jr5zdb/remapping_keys_in_netrw/
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()

  " vim is being opened with a folder as an argument:
  if tabpagenr() == 1 && tabpagewinnr(1, '$') == 1 && bufname() == "NetrwTreeListing"
	nnoremap <buffer><silent> <CR>	<Plug>NetrwLocalBrowseCheck<BAR>:bw#<CR>
  endif

  " fix: do not replace my current 'text file' buffer with netrw content
  nnoremap <buffer> <C-l> <C-W>l

  " switch to the previous window (since we probably used leader+Tab to jump)
  nnoremap <buffer> <C-^> <C-w>p

  " go above and below a directory
  " TODO: better 'h' user experience
  nnoremap <buffer> h <Plug>NetrwBrowseUpDir
  nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck<BAR>zz
  " try to bind leftclick to behave normally...
  " nnoremap <buffer> <LeftMouse> <Plug>NetrwLocalBrowseCheck

  nnoremap <buffer> <leader><TAB> :bw!<CR>
endfunction

