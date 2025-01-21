" =============================================================================
" App
" =============================================================================

" Vimwiki:
let g:vimwiki_list = [{'path': '~/documents/vimwiki',
			\ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_list = [{
" 	\ 'path': '~/documents/vimwiki',
" 	\ 'template_path': '~/documents/vimwiki/templates/',
" 	\ 'template_default': 'default',
" 	\ 'syntax': 'markdown',
" 	\ 'ext': '.md',
" 	\ 'path_html': '~/documents/wiki_extract',
" 	\ 'custom_wiki2html': 'vimwiki_markdown',
" 	\ 'template_ext': '.tpl'}]

" Todo: convert this into a filetype file.
" [terminal] this conflicts with the shortcut <C-W>H mapping
" not a big deal since I am often dealing with vimwiki in a separate tab
augroup onVimwikiBindShiftBackspace
	autocmd!
	autocmd FileType vimwiki nnoremap <silent><buffer> <C-H> :VimwikiGoBackLink<CR>
augroup END


" =============================================================================
" Git
" =============================================================================

" Fugitive:
" ...

" Gitgutter:
" TODO:
"nmap <leader>Hp  <Plug>(GitGutterPreviewHunk)
"nmap <leader>gr  <Plug>(GitGutterUndoHunk)
"nmap <leader>ga  <Plug>(GitGutterStageHunk)
"xmap <leader>ga  <Plug>(GitGutterStageHunk)


" =============================================================================
" Session
" =============================================================================

" Obsession:
" ...

" =============================================================================
" View
" =============================================================================

" FZF:
nnoremap <leader>f :FZF<CR>

" Lightline:
let g:lightline = {
\ 'colorscheme': 'darcula',
\ }

