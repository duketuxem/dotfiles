" Search:
set hlsearch		" highlight searches by default
set incsearch		" find the next match as we type the search
set ignorecase		" ignore case when searching...
set smartcase		" ...unless we type an uppercase letter

" search for the currently selected text in the file
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" shortcut to start a replace from the current line
nnoremap S :.,$s//gc<Left><Left><Left>
" and vim-cool is used to remove highlighted searches automatically (no :nohl)

" okay, I am done searching
nnoremap <silent><CR> :nohl<CR>

" TODO: 1 of N matches while iterating the search results and combine:
" always start a search from the cursor position
" this will loose the 'incsearch' feature.
" not incremental :(
" nnoremap / :.,$/

" should be to replace a selection (is there simpler ?)
" function! GetVisualSelection()
"   " Why is this not a built-in Vim script function?!
"   let [line_start, column_start] = getpos("'<")[1:2]
"   let [line_end, column_end] = getpos("'>")[1:2]
"   let lines = getline(line_start, line_end)
"   if len(lines) == 0
"     return ''
"   endif
"   let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
"   let lines[0] = lines[0][column_start - 1:]
"   let arf = join(lines, "\n")
"   exe ':%s/'.arf."/gc<Left><Left><Left>"
" endfunction
