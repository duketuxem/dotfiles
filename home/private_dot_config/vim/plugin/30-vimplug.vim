" A fallback ? Previous config:
"
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
"Plug 'itchyny/lightline.vim'	" lighter status bar than airline
"Plug 'junegunn/fzf'
"Plug 'preservim/tagbar'         " outline symbols (requires ctags)
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
