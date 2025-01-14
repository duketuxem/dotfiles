" Plugins {{{

" Autoinstall the plugin manager if missing
"if empty(glob('$XDG_CONFIG_HOME/vim/autoload/plug.vim'))
"  silent !curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"call plug#begin('$XDG_CONFIG_HOME/vim/.vim-plug')

" UI
"Plug 'Yggdroot/indentLine'	" show indent levels of spaces
"Plug 'preservim/tagbar'         " outline symbols (requires ctags)
"Plug 'junegunn/fzf'
"" TODO: setup
"Plug 'itchyny/lightline.vim'	" lighter status bar than airline
"
"" motions
"Plug 'tpope/vim-commentary'	" gcc / gcap / ...
"Plug 'tpope/vim-surround'	" cs([
"Plug 'wellle/targets.vim'	" di(
"Plug 'tpope/vim-repeat'		" ?
"Plug 'junegunn/vim-easy-align'	" align on '=' : gaip=
"
"" git
"Plug 'airblade/vim-gitgutter'   " Actual modifications inside the buffer
"Plug 'tpope/vim-fugitive'       " Stage current file from vim, restore...
"
"" resume sessions
"Plug 'tpope/vim-obsession'      " :Obsess / :Obsess!
"
"" vim apps
"Plug 'vimwiki/vimwiki'
" could be a calendar or something...

"call plug#end()

" run :PlugInstall if there are some missing plugins
"autocmd! VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"	\ | PlugInstall --sync | source $MYVIMRC | endif
" }}}


" Plugins config {{{

"" GitGutter:
"nmap <leader>Hp  <Plug>(GitGutterPreviewHunk)
"nmap <leader>Hu  <Plug>(GitGutterUndoHunk)
"nmap <leader>Hs  <Plug>(GitGutterStageHunk)
"xmap <leader>Hs  <Plug>(GitGutterStageHunk)
"
"" FuzzyFinding:
"nnoremap <leader>f :FZF<CR>
"
"" Vimwiki:
"let g:vimwiki_list = [{'path': '~/documents/vimwiki',
"			\ 'syntax': 'markdown', 'ext': '.md'}]
"" let g:vimwiki_list = [{
"" 	\ 'path': '~/documents/vimwiki',
"" 	\ 'template_path': '~/documents/vimwiki/templates/',
"" 	\ 'template_default': 'default',
"" 	\ 'syntax': 'markdown',
"" 	\ 'ext': '.md',
"" 	\ 'path_html': '~/documents/wiki_extract',
"" 	\ 'custom_wiki2html': 'vimwiki_markdown',
"" 	\ 'template_ext': '.tpl'}]
"
"" [terminal] this conflicts with the shortcut <C-W>H mapping
"" not a big deal since I am often dealing with vimwiki in a separate tab
"augroup onVimwikiBindShiftBackspace
"	autocmd!
"	autocmd FileType vimwiki nnoremap <silent><buffer> <C-H> :VimwikiGoBackLink<CR>
"augroup END
"
"" Todo: a cursor plugin ? fix the <C-o> which does not remember cursor
"" automatically restore the previous cursor position
"" keywords: - vim.fandom.com
""           - restore_cursor_to_file_position_in_previous_editing_session
"function! ResCur()
"  if line("'\"") > 1 && line("'\"") <= line("$")
"    if foldclosed(line("'\"")) < 0
"      silent normal! g`"zz
"    else
"      silent normal! g`"zozz
"    endif
"    return 1
"  endif
"endfunction
"
"augroup resCur
"  autocmd!
"  autocmd BufWinEnter * call ResCur()
"augroup END
" }}}

