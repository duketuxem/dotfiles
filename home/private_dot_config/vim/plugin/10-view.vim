" =============================================================================
" User Interface (View)
" =============================================================================

" Appearance:
set number		" show the line numbers on the left side...
set relativenumber	" ...with the numbers relative to the current line
set colorcolumn=80	" show a limit with a vertical mark bar
set conceallevel=0	" never replace any symbol like lambda sign, whatever
set nowrap		" allow long lines to extend as far as they go

set lazyredraw		" faster execution of macros, mappings, etc...

set belloff=all		" no bell
set novisualbell	" disable sound
set vb t_vb=		" clearing the visual bell length deactivates flashing


" when :set wrap, access the visually down/up line
nnoremap j gj
nnoremap k gk

" Splits:
" sane default behavior
set splitbelow
set splitright

" create quick splits (TODO: replace with tmux ?)
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>

" navigation shortcuts
" (TODO: do not break vimwiki's Backspace functionnality)
nnoremap <C-h>		<C-w>h
nnoremap <C-j>		<C-w>j
nnoremap <C-k>		<C-w>k
nnoremap <C-l>		<C-w>l
" my workflow is now mature, is this ever used again ?
" how about tmux ?
"nnoremap <C-Up>		<C-w>k
"nnoremap <C-Left>	<C-w>h
"nnoremap <C-Down>	<C-w>j
"nnoremap <C-Right>	<C-w>l

" non layout destructive :bd
nnoremap <silent> <leader>d :b#<bar>bw!#<CR>
" window/tab destructive :bd
nnoremap <silent> <leader>D :bd<CR>
" shortcut of the shortcut <C-w>c
nnoremap <silent> <leader>c :close<CR>

" Zoom without <C-w><C-o> (create a new 'temporary' window) - awesome trick
nnoremap <silent> <leader>t :-tab split<CR>
" Then close with <leader>c

" Custom:
nnoremap <silent> <leader>l :ls<CR>
nnoremap <silent> <leader>L :ls!<CR>
nnoremap <silent> <leader>q :bprev<CR>
nnoremap <silent> <leader>p :bnext<CR>
nnoremap <leader>e :enew<CR>

" F1 : Help
nnoremap <F2> :set wrap!<CR>
" TODO: " during the paste can this action happen automatically ?
" set pastetoggle=<F3>
nnoremap <F4> :set list!<CR>

" <plugin> mark indentation levels
let g:indentLine_char = '┊'
let g:indentLine_setColors = 1

" Statusline:

set showcmd		" show the command being typed. Ex: "a
set noruler		" deactivate the vim ruler (x:y) - handled in plugin

"-- <plugin> lightline settings
set noshowmode		" avoid native vim --INSERT-- message below lightline
set laststatus=2	" always show the status line
let g:lightline = {
\ 'colorscheme': 'darcula',
\ }


" Color:
" use truecolor (24bit-mode)
set termguicolors

" was this a fix to enable color ?
"if &term =~ "^st"
"	" from :help xterm-true-color
"	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"	" Fixes mouse scrolling in st. Update: it seems fixed
"	"set ttymouse=sgr
"endif

colorscheme my-eighties
