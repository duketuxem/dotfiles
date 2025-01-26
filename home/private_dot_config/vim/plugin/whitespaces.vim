" Is there any case we want to use trailing white spaces ?
" -> Sometimes some 'foreign' files will have whitespaces.
" It is good to know it.
augroup HighlightUselessWhitespaceInRed
	autocmd!

	" does not get triggered whilst you are typing in insert mode
	:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
	autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
augroup END
