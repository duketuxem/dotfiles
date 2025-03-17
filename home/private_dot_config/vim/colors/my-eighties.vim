" My custom color scheme inspired by base16-eighties, by Chris Kempson.
" (https://github.com/chriskempson/base16)

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='my-eighties'

" {{{ Declarations (colors + helper function)
" base16-eighties exact color palette (except term - yet):
let s:dark0  = { "gui": "#2d2d2d", "cli": "237", "term": "07" } " base00
let s:dark1  = { "gui": "#393939", "cli": "1000" } 		" base01
let s:dark2  = { "gui": "#515151", "cli": "237" } 		" base02
let s:dark3  = { "gui": "#747369", "cli": "8" } 		" base03
let s:dark4  = { "gui": "#a09f93", "cli": "1000" } 		" base04
let s:dark5  = { "gui": "#d3d0c8", "cli": "1000" } 		" base05
let s:dark6  = { "gui": "#e8e6df", "cli": "1000" } 		" base06
let s:dark7  = { "gui": "#f2f0ec", "cli": "1000" } 		" base07
let s:red    = { "gui": "#f2777a", "cli": "3" } 		" base08
let s:orange = { "gui": "#f99157", "cli": "3" } 		" base09
let s:yellow = { "gui": "#ffcc66", "cli": "3" } 		" base0A
let s:green  = { "gui": "#99cc99", "cli": "2" } 		" base0B
let s:cyan   = { "gui": "#66cccc", "cli": "3" } 		" base0C
let s:blue   = { "gui": "#6699cc", "cli": "3" } 		" base0D
let s:purple = { "gui": "#cc99cc", "cli": "6" } 		" base0E
let s:deprec = { "gui": "#d27b53", "cli": "6" } 		" base0F
" Additionnal colors from me
let s:bonus_dark1  = { "gui": "#303030", "cli": "1000" } " 80 col mark
let s:bonus_green  = { "gui": "#2b5437", "cli": "9" } 	 " Github green
let s:bonus_red    = { "gui": "#4e231d", "cli": "9" } 	 " Github red
let s:bonus_orange = { "gui": "#cc7400", "cli": "9" } 	 " Ochre
let s:bonus_olight = { "gui": "#d18117", "cli": "9" } 	 " lighter than Ochre

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

" {{{ Binding
" {{{ Editor elements
call s:h("Normal",       s:dark6, s:dark0, "")      " BG / FG
call s:h("LineNr",       s:dark2, s:dark0, "")      " Vert. numbers
call s:h("CursorLineNr", s:dark2, s:dark0, "")      " The infamous netrw cursor
call s:h("ColorColumn",  "", s:bonus_dark1, "")     " 80 col. marker
call s:h("Folded",       s:dark3, s:dark1, "bold")  " Fold appearance
call s:h("MatchParen",   "", s:blue, "")            " Matching ( )
call s:h("VertSplit",    s:dark2, s:dark0, "")      " Pane separator
call s:h("StatusLine",   "", s:dark3, "")           " 1 char. gap current
call s:h("StatusLineNC", "", s:dark0, "")           " ^^^ if same as above
call s:h("NonText",      s:blue, "", "")            " '~' in end of file
call s:h("Visual",       "", s:dark2, "")
call s:h("TabLine",      "", "", "") 		    " >> Those 3 are
call s:h("TabLineSel",   "", "", "")		    " >> managed by
call s:h("TabLineFill",  "", "", "")		    " >> [light/air]line
call s:h("Title",        "", "", "")		    " :set all | :autocmd

call s:h("Search",       s:dark0, s:yellow, "")     " Past search
call s:h("IncSearch",    s:dark0, s:blue, "")       " Current search
call s:h("Directory",    s:blue, "", "")            " :e <tab><tab> + tree
call s:h("Pmenu",        s:dark6, s:dark2, "")
call s:h("PmenuSBar",    "", s:cyan, "")
call s:h("PmenuSel",     s:dark0, s:yellow, "")
call s:h("PmenuThumb",   "", s:cyan, "")
call s:h("ErrorMsg",     "", s:bonus_red, "")

call s:h("DiffAdd",      "", s:bonus_green, "")
call s:h("DiffChange",   "", s:dark3, "")
call s:h("DiffDelete",   "", s:bonus_red, "")
call s:h("DiffText",     "", s:bonus_olight, "")
" }}}
" {{{ General syntax (see :h group-name)
call s:h("PreProc",        s:red, "", "")     " #include / #ifndef...
call s:h("Function",       s:blue, "", "")    " func()
call s:h("cCustomFunc",    s:blue, "", "")    " see my custom syntax/c.vim file
call s:h("Type",           s:yellow, "", "")  " int long
call s:h("Structure",      s:yellow, "", "")  " struct is also a type to me
call s:h("Typedef",        s:orange, "", "")  " typedef
call s:h("StorageClass",   s:cyan, "", "")    " const, static
call s:h("Identifier",     s:yellow, "", "")  " Var type
call s:h("Constant",       s:orange, "", "")  " NULL
call s:h("Boolean",        s:orange, "", "")
call s:h("Number",         s:orange, "", "")
call s:h("Float",          s:orange, "", "")
call s:h("String",         s:green, "", "")
call s:h("Character",      s:green, "", "")
call s:h("Statement",      s:purple, "", "")
call s:h("Delimiter",      s:dark6, "", "")   " + . = ( ) ...
" + - = are white
hi! link Operator          Delimiter

call s:h("Comment",        s:dark3, "", "")
call s:h("Todo",           s:orange, "", "bold,underline")
call s:h("Special",        s:cyan, "", "")
call s:h("SpecialComment", s:cyan, "", "")
call s:h("Debug",          s:cyan, "", "")
call s:h("Ignore",         s:dark0, "", "")
call s:h("Underlined",     s:blue, "", "underline")
call s:h("Error",          s:bonus_red, "", "")
hi! link Error             ErrorMsg
" }}}

" {{{ Vim
call s:h("vimParenSep",       s:dark6, "", "")      " Paren same as text: white
call s:h("vimOperParen",      s:dark6, "", "")      " Paren commas same as text
call s:h("vimOption",         s:red, "", "")       " i.e.: anything after a set
call s:h("vimFunction",       s:blue, "", "")      " function name highlighting
call s:h("vimAutoEvent",      s:orange, "", "")    " AuBuf / ...
call s:h("vimEnvVar",         s:yellow, "", "")    " Var is yellow
call s:h("vimCommentTitle",   s:bonus_olight, "", "")
" }}}
" {{{ JavaScript
" call s:h("javaExternal", s:purple, "", "")  " import
" }}}
" {{{ Typescript
" I don't get why so many defined syntax groups are being skipped...
" see /usr/share/vim/vim90/syntax/shared/typescriptcommon.vim
"
" blue - classes & funcs & variable declaration
call s:h("typescriptClassName",		s:blue, "", "")	" Programming 'symbols'
call s:h("typescriptClassHeritage",	s:blue, "", "")	" implements 'name' {.}
call s:h("typescriptInterfaceName",	s:blue, "", "")
call s:h("typescriptArrowFunc",		s:blue, "", "")
call s:h("typescriptVariableDeclaration", s:blue, "", "")
" orange - class instances and alike
call s:h("typescriptIdentifier",	s:orange, "", "") " 'this' keyword
call s:h("typescriptOperator",		s:orange, "", "") " 'new' keyword
" red - class attributes, arrow funcs arguments, props
call s:h("typescriptCall", s:red, "", "")
call s:h("typescriptPaymentShippingOptionProp", s:red, "", "") " id/label
" yellow - literals / variable declaration
call s:h("typescriptObjectLabel", s:yellow, "", "")	" { objlabel: 'value' }
" white - Everything else
call s:h("typescriptObjectLiteral", s:dark6, "", "")	" commas within object
call s:h("typescriptBlock", s:dark6, "", "")		" Most of the text
call s:h("typescriptBraces", s:dark6, "", "")		" {}
call s:h("typescriptEndColons", s:dark6, "", "")	" consistent 'normal' ;
" purple
call s:h("typescriptVariable", s:purple, "", "")	" const
" }}}
" {{{ HTML
call s:h("htmlTitle", s:blue, "", "bold")
call s:h("htmlH1", s:blue, "", "bold")
call s:h("htmlH2", s:blue, "", "bold")
call s:h("htmlH3", s:blue, "", "bold")
call s:h("htmlH4", s:blue, "", "bold")
call s:h("htmlH5", s:blue, "", "bold")
call s:h("htmlH6", s:blue, "", "bold")

" white < >
call s:h("htmlTag", s:dark6, "", "")
call s:h("htmlEndTag", s:dark6, "", "")

call s:h("htmlTagName", s:red, "", "")
call s:h("htmlItalic", s:orange, "", "bold")
" }}}
" {{{ JSON
call s:h("JsonKeyword", s:yellow, "", "")
call s:h("JsonBoolean", s:orange, "", "")
" }}}
" {{{ Perl
call s:h("PerlMethod", s:blue, "", "")
" }}}
" {{{ TODO: Java
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
" {{{ Php
call s:h("phpRegion", s:yellow, "", "") " paint it in yellow !
call s:h("phpParent", s:yellow, "", "") " paint it in yellow !
call s:h("phpType", s:green, "", "") " To contrast with yellow
call s:h("phpDefine", s:purple, "", "") " new/function
call s:h("phpOperator", s:purple, "", "") " consistence with = / + / < / ++
call s:h("phpVarSelector", s:red, "", "")  " $ before VARNAME
call s:h("phpIdentifier", s:red, "", "")  " variables / instances
call s:h("phpMemberSelector", s:purple, "", "")  " ->
call s:h("phpStructure", s:purple, "", "")  " namespace / class / extends...
call s:h("phpMethodsVar", s:blue, "", "")  " members of classes
call s:h("phpSpecialFunction", s:dark7, "", "")  " members of classes
call s:h("Delimiter", s:orange, "", "")  " <?php
" }}}

" netrw {{{
call s:h("netrwTreeBar", s:purple, "", "")
" }}}

" {{{ Extensions
" Vimwiki
call s:h("VimwikiHeader1",	s:orange, "", "bold")
call s:h("VimwikiHeader2",	s:green, "", "bold")
call s:h("VimwikiHeader3",	s:yellow, "", "bold")
call s:h("VimwikiHeader4",	s:cyan, "", "bold")
call s:h("VimwikiHeader5",	s:red, "", "bold")
call s:h("VimwikiHeader6",	s:purple, "", "bold")
call s:h("VimwikiLink",		s:blue, "", "underline") " underline KO...
call s:h("VimwikiCode",		s:yellow, "", "")
call s:h("VimwikiListTodo",	s:purple, "", "")

" hi VimwikiHeaderChar
" hi VimwikiHR
" hi VimwikiList
" hi VimwikiTag
" hi VimwikiMarkers
"
" GitGutter
" Not accurate, look more to actually configure it...
call s:h("SignColumn",	s:blue, "", "bold")

" }}}

delf s:h
unlet s:dark0 s:dark1 s:dark2 s:dark3 s:dark4 s:dark5 s:dark6 s:dark7
	\ s:red s:orange s:yellow s:green s:cyan s:blue s:purple s:deprec
	\ s:bonus_dark1 s:bonus_green s:bonus_red s:bonus_orange s:bonus_olight

" vim: fdm=marker
