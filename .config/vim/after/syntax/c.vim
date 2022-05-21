" This file adds syntax support for functions and classes in C.
" see:
" https://stackoverflow.com/questions/736701/class-function-names-highlighting-in-vim
"
" TODO: make distinction between functions and MACROS() ?

syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def cCustomFunc  gui=bold guifg=yellowgreen
hi def link cCustomClass Function

