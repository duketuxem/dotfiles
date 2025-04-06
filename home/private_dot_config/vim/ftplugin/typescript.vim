setlocal tabstop=2

" This one really drove me nuts:
" Fixes the awful 'I refuse to indent on a new line in typescriptreact ft'
" I also had to delete vim-html-template-literals that was also conflicting
setlocal indentexpr=GetTypescriptIndent()
setlocal autoindent nolisp nosmartindent
setlocal indentkeys+=0],0)

