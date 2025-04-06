" The following was an attempt to use netrw as an improved base.
" It...could work, but if I want some git status, icons, it is a lot of hassle.
" The rest would be handled by an external project drawer, for now vim-fern.

" This is kept for reference, but if netrw is deactivated some feature like
" opening an URL (vim https://raw.github.com...) would break.
" The idea is to have a sane default config to act as a fallback.
" Deactivate netrw, see :h netrw-noload
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1
" Prevent further settings
" finish

let g:netrw_banner = 0		" remove header
let g:netrw_liststyle = 3	" tree like listing
let g:netrw_fastbrowse = 0	" always re-read directories content
let g:netrw_browse_split = 4	" open entries in previous buffer
let g:netrw_winsize = 30	" uses a percentage, which we don't want
let g:netrw_list_hide = &wildignore
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Acces and reaccess netrw from any buffer
" commented-out in favor of vim-fern
" nnoremap <silent><expr> <leader><TAB> !bufexists('NetrwTreeListing')
" 			\ ? ':20Lexplore %:p:h<CR>'
" 			\ : ':5wincmd h<CR>'

function! NetrwMapping()

  " vim is being opened with a folder as an argument:
  " once the file is found and opened (potentially several <CR> involved),
  " the netrw buffer is going to be wiped.
  if tabpagenr() == 1 && tabpagewinnr(1, '$') == 1 && bufname() == "NetrwTreeListing"
	nnoremap <silent><buffer><expr>	<CR> getline('.') =~ '/$'
		\ ? '<Plug>NetrwLocalBrowseCheck<BAR>zz'
		\ : '<Plug>NetrwLocalBrowseCheck<BAR>:silent bw! 1 2<CR>'
  endif

  " fix: do not replace my current 'text file' buffer with netrw content
  nnoremap <buffer> <C-l> <C-W>l

  " ux:
  " switch to the previous window
  nnoremap <buffer> <C-^> <C-w>p
  " refresh with Ctrl R (looses the cursor position)
  nnoremap <buffer> <c-r> :e .<cr>
  " go above and below a directory
  " TODO: better 'h' user experience
  nnoremap <buffer> h <Plug>NetrwBrowseUpDir
  nnoremap <buffer> l <Plug>NetrwLocalBrowseCheck<BAR>zz
  " try to bind leftclick to behave normally...
  " nnoremap <buffer> <LeftMouse> <Plug>NetrwLocalBrowseCheck<BAR>zz
  " note: original came with nmap
  " noremap <buffer> <CR> :normal v<CR>

  " close the tree if already focused
	" commented out in favor of vim-fern
  " nnoremap <buffer><silent> <leader><TAB> :bw!<CR>
endfunction

" https://www.reddit.com/r/neovim/comments/jr5zdb/remapping_keys_in_netrw/
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

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
