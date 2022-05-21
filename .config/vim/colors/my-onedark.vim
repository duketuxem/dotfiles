" My custom adaptation of the onedark theme

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='my-onedark'


" Color definitions and setting
" {{{

" [Editor]
let s:background  = { "gui": "#282c34", "cli": "237" } " 235 classic onedark | NONE
let s:foreground  = { "gui": "#abb2bf", "cli": "145" } " NONE
let s:columnMark  = { "gui": "#2c323c", "cli": "236" } " 0
let s:comment     = { "gui": "#5c6370", "cli": "59" } "cterm 7
let s:lineNumbers = { "gui": "#4b5263", "cli": "237" }
let s:selection   = s:lineNumbers
" [Content]
let s:includes    = { "gui": "#f2777a", "cli": "3" }  " require, import
let s:functions   = { "gui": "#61afef", "cli": "39" }  " cterm 4func()
let s:variables   = { "gui": "#d19a66", "cli": "180" }  "cterm11 variable=
let s:numbers     = { "gui": "#f99157", "cli": "3" }  " 123
let s:constants   = { "gui": "#56b6c2", "cli": "38" } "cterm38 NULL, True, False
let s:strings     = { "gui": "#98c379", "cli": "114" }  " cterm2 and chars
let s:statements  = { "gui": "#c678dd", "cli": "170" }  " cterm 5if, return, try
let s:escSequences= { "gui": "#66cccc", "cli": "3" }  " \033
let s:decorators  = s:escSequences                    " @somethinG

let s:diffAdd     = { "gui": "#225925", "cli": "9" }
let s:diffDelete  = { "gui": "#a42a28", "cli": "9" }
let s:diffChange  = { "gui": "#e5c07b", "cli": "9" } "cterm3
let s:diffText    = { "gui": "#d18117", "cli": "9" }

let s:todos       = s:variables
let s:dasistdas   = { "gui": "#00ffff", "cli": "9" }


" Helper function
" A slightly modified version from sonph/onehalf
function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cli
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cli
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfunction
" }}}


" Editor components syntax
" {{{
" Static UI
call s:h("Normal",       s:foreground, s:background, "")
call s:h("LineNr",       s:lineNumbers, s:columnMark, "") " Vert. numbers
call s:h("ColorColumn",  "", s:columnMark, "")            " Vert. marker 80 col
call s:h("Folded",       s:comment, "", "bold")           " Folds
call s:h("MatchParen",   "", s:escSequences, "")          " Active parenthesis
call s:h("VertSplit",    s:background, s:comment, "")     " Pane separator
call s:h("StatusLine",   "", s:comment, "")               " 1 char. gap current
call s:h("StatusLineNC", "", s:background, "")            " ^^^ if same as above
call s:h("NonText",      s:lineNumbers, "", "")           " '~' in end of file
" During use
call s:h("Visual",       "", s:selection, "")
call s:h("Search",       s:background, s:variables, "")   " Past search
call s:h("IncSearch",    s:background, s:functions, "")   " Current search
call s:h("Directory",    s:functions, "", "")             " :e <tab><tab> + tree
call s:h("Pmenu",        s:foreground, s:lineNumbers, "")
call s:h("PmenuSBar",    "", s:escSequences, "")
call s:h("PmenuSel",     s:background, s:variables, "")
call s:h("PmenuThumb",   "", s:escSequences, "")
call s:h("ErrorMsg",     "", s:diffDelete, "")
" Diff mode
call s:h("DiffAdd",      "", s:diffAdd, "")
call s:h("DiffChange",   "", s:diffChange, "")
call s:h("DiffDelete",   "", s:diffDelete, "")
call s:h("DiffText",     "", s:diffText, "")
" Not in use (at least for now)
" ____________________________
" TabLine     | }
" TabLineSel  | }} Those are managed by [light/air]line
" TabLineFill | }
" Conceal     | To turn `lambda` into lambda sign
" Title       | :set all | :autocmd
" }}}


" General syntax
" {{{
call s:h("PreProc",        s:includes, "", "")
call s:h("Function",       s:functions, "", "")   " def _Function_

" Typing scope
call s:h("Type",           s:strings, "", "")
call s:h("Typedef",        s:strings, "", "bold")
call s:h("StorageClass",   s:strings, "", "bold")
call s:h("Structure",      s:strings, "", "bold")

" Function scope
call s:h("Identifier",     s:variables, "", "")   " Var name
call s:h("Constant",       s:constants, "", "")   " NULL
call s:h("Boolean",        s:constants, "", "")
call s:h("String",         s:strings, "", "")
call s:h("Character",      s:strings, "", "")
call s:h("Number",         s:numbers, "", "")
call s:h("Float",          s:numbers, "", "")
call s:h("Statement",      s:statements, "", "bold")
call s:h("Delimiter",      s:foreground, "", "")  " + . = ( ) ...
" + - = are white
hi! link Operator          Delimiter

" Misc
call s:h("Comment",        s:comment, "", "")
call s:h("Todo",           s:background, s:variables, "bold,underline")
call s:h("Special",        s:escSequences, "", "")
call s:h("SpecialComment", s:escSequences, "", "")
call s:h("Debug",          s:escSequences, "", "")
call s:h("Ignore",         s:background, "", "")
call s:h("Underlined",     s:functions, "", "underline")
call s:h("Error",          s:diffDelete, "", "")
hi! link Error             ErrorMsg
" }}}


" Languages TODO:
" {{{ Vim
"call s:h("vimNotation",   s:constants, "", "")     " vim keywords | set/call...
"call s:h("vimOption",     s:numbers, "", "")       " hidden / mouse / noruler
"
"call s:h("vimFunction",   s:functions, "", "bold")
"
"call s:h("vimCommand",   s:functions, "", "bold")
"call s:h("vimFuncKey",   s:functions, "", "bold")
"call s:h("vimNotFunc",    s:functions, "", "bold")
"
"call s:h("vimVar",        s:variables, "", "")
"call s:h("vimFuncVar",    s:numbers, "", "")
"hi! link vimSetSep         Delimiter
"hi! link vimContinue       Delimiter
"hi! link vimHiAttrib       Constant
" }}}


" {{{ HTML
"call s:h("htmlTag", s:foreground, "", "")  " < >
"call s:h("htmlEndTag", s:foreground, "", "") " </>
"call s:h("htmlTagN", s:statements, "", "")
"call s:h("htmlTagName", s:constants, "", "")
"call s:h("htmlArg", s:numbers, "", "")   " href / class / charset...
""call s:h("htmlBold", s:
"call s:h("htmlH1", s:constants, "", "")
"call s:h("htmlH2", s:constants, "", "")
"call s:h("htmlH3", s:constants, "", "")
"call s:h("htmlH4", s:constants, "", "")
"call s:h("htmlH5", s:constants, "", "")
"call s:h("htmlH6", s:constants, "", "")
"call s:h("htmlItalic", { "fg": s:constants, "gui": "italic", "cterm": "italic" })
"call s:h("htmlLink", { "fg": s:statements, "gui": "underline", "cterm": "underline" })
"call s:h("htmlSpecialChar", { "fg": s:dark_numbers })
"call s:h("htmlSpecialTagName", { "fg": s:numbers })
"call s:h("htmlTitle", { "fg": s:white })
" }}}

delf s:h

unlet s:background s:foreground s:columnMark s:comment s:lineNumbers
      \ s:includes s:functions s:variables s:numbers s:constants s:strings
      \ s:statements s:escSequences s:decorators s:diffAdd s:diffDelete
      \ s:diffChange s:diffText s:todos s:dasistdas
