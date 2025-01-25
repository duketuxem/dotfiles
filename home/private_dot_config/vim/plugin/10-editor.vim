" General:
set hidden		" allow background buffers
set swapfile		" warn/recover the same opened file multiple times
set tags=tags		" default file name to look for tags
set noautochdir		" autochdir changes the global directory, not win/tab

set mouse=a		" use mouse for all vim modes (normal/visual...)
set backspace=indent,eol,start	" erase back even in insert mode

set textwidth=79	" do break text with a newline after n typped chars
set nojoinspaces	" leave only one space when joining (gqg)
set showmatch		" briefly highlight the matching ( { [ if any


" Tabs:			(Historical reason to choose 8 as a default)
set tabstop=8		" number of spaces that a <Tab> in a file counts for
set shiftwidth=0	" number of spaces to use for each step of (auto)indent
set softtabstop=0	" do not mix space and tabs to make up a set spacing
set noexpandtab		" never replace tabs with space


" Folds:
set foldenable
set foldmethod=marker
set foldlevelstart=0	" close most folds when opening a file
set foldnestmax=2	" maximum number of folds inside folds
set foldopen-=block	" do not open ( { [ folds when 'h/j/k/l' on them
" set foldclose=all	" auto close fold when leaving the fold scope

" TODO: apply this to anything ?
" C/C++ functions and so on
" custom fold expression function
function! MyShFoldExpr(lnum)
    " Get the current line
    let line = getline(a:lnum)
    " Check for block start
    if line =~ '^{\s*$'
        " echom "Start fold at line ".a:lnum
        return '>1'
    " Check for block end
    elseif line =~ '^\s*}$'
        " echom "End fold at line ".a:lnum
        return '<1'
    " Inside a fold
    else
        return '=1'
    endif
endfunction
augroup sh_folding
  autocmd!
  autocmd FileType sh setlocal foldmethod=expr
  autocmd FileType sh setlocal foldexpr=MyShFoldExpr(v:lnum)
augroup END


" Copy / Cut / Paste {{{
" Partial line copy/cut support: check (/)
if executable('xsel')
	" Prefer using xsel, as it handles text better.
	" See below to know which corner case it is solving
	vnoremap <silent> <C-c>
		\ "zy <BAR> :call system('xsel -i -b', @z)<CR>
	vnoremap <silent> <C-x>
		\ "zy <BAR> :call system('xsel -i -b', @z)<BAR>:normal gvd<CR>
elseif executable('xclip')
	" This works except when vim is suspended (^Z):
	" A selection is made using vim's visual mode
	" The selection got 'copied' to the clipboard with ^C
	" Vim is suspended with ^Z
	" Try to paste the selection in say Firefox/Mousepad... Nothing happens
	" Resume Vim with `fg`
	" The selection finally pops out into the process it was made.
	" If there were 2 ^V, the selection got pasted twice, and so on...
	"
	" This drove me crazy to the point I gave up and use xsel or don't ^Z.
	" here are some resources:
	" https://github.com/astrand/xclip/issues/20
	" https://askubuntu.com/questions/705620/xclip-vs-xsel
	" https://wiki.archlinux.org/title/Tmux#On_Xorg
	vnoremap <silent> <C-c>
		\ "zy :call system('xclip -selection clipboard', @z)<CR>
	vnoremap <silent> <C-x>
		\ "zy :call system('xclip -selection clipboard', @z)<BAR>
		\ :normal gvd<CR>
elseif executable('wl-clip')
	" Wayland
elseif executable('clip.exe')
	" To test WSL
endif
" }}}


" Files:
set encoding=UTF-8
set autoread		" reload files changed outside vim
augroup onFocusAttemptToTriggerAutoread
	autocmd!
	" note: this is still not close to real-time
	autocmd FocusGained,BufEnter * :checktime
augroup END

set modeline		" enable <fileCommentChar> vim: fdm=marker
set modelines=1		" limit lines to read
