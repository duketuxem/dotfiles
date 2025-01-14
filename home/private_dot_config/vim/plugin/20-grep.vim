" TOFIX: quickfix window resume wrong, or should close ?
" to adapt to our needs

set grepprg=ag\ --color\ --vimgrep

function! Grep(...)
	echo join([&grepprg] + [expandcmd(join(a:000, ' '))], ' ')
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ?  'Grep'  : 'grep'
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ?  'LGrep' : 'lgrep'

" if any match, send the output of the Grep command to the quickfix list and set the cursor inside
augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
	" autocmd QuickFixCmdPost grep cwindow
augroup END
