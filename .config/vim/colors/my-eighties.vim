" My favorite color mapping using the palette of Base16-eighties.

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='my-eighties'

" Declarations (colors + helper function)
" {{{
"
" Vanilla Base16-eighties color palette
" -------------------------------------

" From darkest to lightest
let s:dark0  = { "gui": "#2d2d2d", "cli": "237", "term": "07" } " base00
let s:dark1  = { "gui": "#393939", "cli": "1000" } " base01
let s:dark2  = { "gui": "#515151", "cli": "237" } " base02
let s:dark3  = { "gui": "#747369", "cli": "8" } " base03
let s:dark4  = { "gui": "#a09f93", "cli": "1000" } " base04
let s:dark5  = { "gui": "#d3d0c8", "cli": "1000" } " base05
let s:dark6  = { "gui": "#e8e6df", "cli": "1000" } " base06
let s:dark7  = { "gui": "#f2f0ec", "cli": "1000" } " base07

let s:red    = { "gui": "#f2777a", "cli": "3" } " base08
let s:orange = { "gui": "#f99157", "cli": "3" } " base09
let s:yellow = { "gui": "#ffcc66", "cli": "3" } " base0A
let s:green  = { "gui": "#99cc99", "cli": "2" } " base0B
let s:cyan   = { "gui": "#66cccc", "cli": "3" } " base0C
let s:blue   = { "gui": "#6699cc", "cli": "3" } " base0D
let s:purple = { "gui": "#cc99cc", "cli": "6" } " base0E
let s:deprec = { "gui": "#d27b53", "cli": "6" } " base0F Deprecated

" Additionnal colors from me
let s:bonus_dark1  = { "gui": "#303030", "cli": "1000" } " 80 col mark
let s:bonus_green  = { "gui": "#225926", "cli": "9" } " Lincoln Green
let s:bonus_red    = { "gui": "#a42a28", "cli": "9" } " Auburn
let s:bonus_orange = { "gui": "#cc7400", "cli": "9" } " Ochre
let s:bonus_olight = { "gui": "#d18117", "cli": "9" } " lighter than Ochre


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



" Editor components
" {{{

" Static UI
call s:h("Normal",       s:dark6, s:dark0, "")     " BG / FG
call s:h("LineNr",       s:dark3, s:dark1, "")     " Vert. numbers...
call s:h("ColorColumn",  "", s:bonus_dark1, "")    " 80 col. marker
call s:h("Folded",       s:dark3, s:dark1, "bold") " Fold appearance
call s:h("MatchParen",   "", s:blue, "")           " Matching ( )
call s:h("VertSplit",    s:dark1, s:dark3, "")     " Pane separator
call s:h("StatusLine",   "", s:dark3, "")          " 1 char. gap current
call s:h("StatusLineNC", "", s:dark0, "")          " ^^^ if same as above
call s:h("NonText",      s:blue, "", "")           " '~' in end of file
" During use
call s:h("Visual",       "", s:dark2, "")
call s:h("Search",       s:dark0, s:yellow, "")   " Past search
call s:h("IncSearch",    s:dark0, s:blue, "")     " Current search
call s:h("Directory",    s:blue, "", "")          " :e <tab><tab> + tree
call s:h("Pmenu",        s:dark6, s:dark2, "")
call s:h("PmenuSBar",    "", s:cyan, "")
call s:h("PmenuSel",     s:dark0, s:yellow, "")
call s:h("PmenuThumb",   "", s:cyan, "")
call s:h("ErrorMsg",     "", s:bonus_red, "")
" Diff mode
call s:h("DiffAdd",      "", s:bonus_green, "")
call s:h("DiffChange",   "", s:bonus_orange, "")
call s:h("DiffDelete",   "", s:bonus_red, "")
call s:h("DiffText",     "", s:bonus_olight, "")
" Not in use (at least for now)
" ____________________________
" TabLine     | }
" TabLineSel  | }} Those are managed by [light/air]line
" TabLineFill | }
" Conceal     | To turn `lambda` into lambda sign
" Title       | :set all | :autocmd
" }}}


" General syntax (see :h group-name)
" {{{
call s:h("PreProc",        s:red, "", "")     " #include / #ifndef...
call s:h("Function",       s:blue, "", "")    " func()
call s:h("cCustomFunc",    s:blue, "", "")    " see my custom syntax/c.vim file
call s:h("Type",           s:yellow, "", "")  " int long
call s:h("Structure",      s:yellow, "", "")  " struct is also a type to me
call s:h("Typedef",        s:orange, "", "")  " typedef
call s:h("StorageClass",   s:cyan, "", "")    " const, static
call s:h("Identifier",     s:yellow, "", "")   " Var type
call s:h("Constant",       s:orange, "", "")   " NULL
call s:h("Boolean",        s:orange, "", "")
call s:h("Number",         s:orange, "", "")
call s:h("Float",          s:orange, "", "")
call s:h("String",         s:green, "", "")
call s:h("Character",      s:green, "", "")
call s:h("Statement",      s:purple, "", "")
call s:h("Delimiter",      s:dark6, "", "")  " + . = ( ) ...
" + - = are white
hi! link Operator          Delimiter

call s:h("Comment",        s:dark3, "", "")
call s:h("Todo",           s:dark0, s:yellow, "bold,underline")
call s:h("Special",        s:cyan, "", "")
call s:h("SpecialComment", s:cyan, "", "")
call s:h("Debug",          s:cyan, "", "")
call s:h("Ignore",         s:dark0, "", "")
call s:h("Underlined",     s:blue, "", "underline")
call s:h("Error",          s:bonus_red, "", "")
hi! link Error             ErrorMsg
" }}}


" {{{ Vim
call s:h("vimOption",     s:red, "", "")       " i.e.: anything after a set
call s:h("vimFunction",   s:blue, "", "")      " function name highlighting
call s:h("vimAutoEvent",  s:orange, "", "")    " AuBuf / ...
call s:h("vimEnvVar",     s:yellow, "", "")    " Var is yellow
" }}}

" {{{ JavaScript
" call s:h("javaExternal", s:purple, "", "")  " import
" }}}


" HTML
" {{{
call s:h("htmlTag", s:dark6, "", "")
call s:h("htmlEndTag", s:dark6, "", "")
call s:h("htmlTagName", s:red, "", "")

call s:h("htmlTitle", s:blue, "", "bold")
call s:h("htmlH1", s:blue, "", "bold")
call s:h("htmlH2", s:blue, "", "bold")
call s:h("htmlH3", s:blue, "", "bold")
call s:h("htmlH4", s:blue, "", "bold")
call s:h("htmlH5", s:blue, "", "bold")
call s:h("htmlH6", s:blue, "", "bold")

call s:h("htmlItalic", s:orange, "", "bold")
" }}}

" JSON
" {{{
call s:h("JsonKeyword", s:yellow, "", "")
call s:h("JsonBoolean", s:red, "", "")
" }}}

" TODO: Resume from here
" {{{ Java
" Consider switching to neovim ? ...
call s:h("javaExternal", s:purple, "", "")  " import
call s:h("javaScopeDecl", s:purple, "", "") " public
call s:h("javaClassDecl", s:purple, "", "") " class
call s:h("javaStorageClass", s:purple, "", "") " static
call s:h("javaType", s:blue, "", "") " int/long
call s:h("javaNumber", s:yellow, "", "") " int/long
call s:h("javaConstant", s:red, "", "") " null
call s:h("javaOperator", s:purple, "", "") " new
call s:h("javaTypedef", s:orange, "", "") " this

call s:h("javaAnnotation", s:cyan, "", "") " @Override
" }}}

delf s:h
unlet s:dark0 s:dark1 s:dark2 s:dark3 s:dark4 s:dark5 s:dark6 s:dark7
	\ s:red s:orange s:yellow s:green s:cyan s:blue s:purple
	\ s:deprec s:bonus_dark1 s:bonus_green s:bonus_red s:bonus_orange
	\ s:bonus_olight

" vim: fdm=marker