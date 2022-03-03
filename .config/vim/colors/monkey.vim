" My first attempt at theming, still a work in progress
"
" :so $VIMRUNTIME/syntax/hi-test.vim
" Order picked from vim/desert.vim
set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='monkey'


" Color Declaration {{{

let s:normal_black   = { "gui": "#282c34", "cli": "0" }
let s:normal_red     = { "gui": "#e06c75", "cli": "1" }
let s:normal_green   = { "gui": "#98c379", "cli": "2" }
let s:normal_yellow  = { "gui": "#e5c07b", "cli": "3" }
let s:normal_blue    = { "gui": "#61afef", "cli": "4" }
let s:normal_magenta = { "gui": "#c678dd", "cli": "5" }
let s:normal_cyan    = { "gui": "#56b6c2", "cli": "6" }
let s:normal_white   = { "gui": "#abb2bf", "cli": "7" }

let s:bright_black   = { "gui": "#ff00ff", "cli": "8" }
let s:bright_red     = { "gui": "#ff00f3", "cli": "9" }
let s:bright_green   = { "gui": "#ff005f", "cli": "10" }
let s:bright_yellow  = { "gui": "#ff00ff", "cli": "11" }
let s:bright_blue    = { "gui": "#ff5512", "cli": "12" }
let s:bright_magenta = { "gui": "#ff5512", "cli": "13" }
let s:bright_cyan    = { "gui": "#ff5512", "cli": "14" }
let s:bright_white   = { "gui": "#ff5512", "cli": "15" }

let s:another_black  = { "gui": "#282c34", "cli": "237" } " For background
let s:another_white  = { "gui": "#2c323c", "cli": "238" } " For marking UI

let s:bronze  = { "gui": "#2c323c", "cli": "138" } " For line terminators
let s:light_select = { "gui": "#2c323c", "cli": "250" } " For line terminators
let s:test = { "gui": "#2c323c", "cli": "13" } " For line terminators

"
" dark_red    be5046 | 196 | 9
" dark_yellow d19a66 | 173 | 11
" com gray    2c323c | 59 | 7
"

"comment_grey"   "gui": "#5C6370", "cterm": "59", "cterm16": "7" }),
"gutter_fg_grey" "gui": "#4B5263", "cterm": "238", "cterm16": "8" }),
"cursor_grey":   "gui": "#2C323C", "cterm": "236", "cterm16": "0" }),
"visual_grey":   "gui": "#3E4452", "cterm": "237", "cterm16": "8" }),
"menu_grey":     "gui": "#3E4452", "cterm": "237", "cterm16": "7" }),
"special_grey":  "gui": "#3B4048", "cterm": "238", "cterm16": "7" }),
"vertsplit":     "gui": "#3E4452", "cterm": "59", "cterm16": "7" })
" }}}

" [ Binding function ]
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


" Highlight definitions {{{
"
" Vim UI and features
call s:h("Normal", s:normal_white, s:another_black, "")  " FG / BG
call s:h("ColorColumn", "", s:another_white, "")         " Vert. marker 80 col
call s:h("LineNr", s:bright_black, "", "")               " Vert. numbers
call s:h("NonText", s:bronze, "", "")                    " :set list
call s:h("Visual", "", s:light_select, "")               " Visual selection look
call s:h("Folded", s:bright_black, "", "bold")           " Folds default closing

call s:h("Cursor", s:normal_red, "", "")                 " Non applicable ???
call s:h("CursorIM", s:normal_red, "", "")               " IME (for chinese ?)
call s:h("VisualNOS", "", s:light_select, "")            " Non applicable ???


"call s:h("IncSearch           ctermfg=0     ctermbg=13    cterm=NONE
"call s:h("Search              ctermfg=0     ctermbg=10
"call s:h("StatusLine          ctermfg=7     ctermbg=0     cterm=bold
"call s:h("StatusLineNC        ctermfg=8     ctermbg=0     cterm=bold
"call s:h("VertSplit           ctermfg=0     ctermbg=0     cterm=NONE
"call s:h("TabLine             ctermfg=8     ctermbg=0     cterm=NONE
"call s:h("TabLineSel          ctermfg=7     ctermbg=0
"call s:h("Conceal             ctermfg=6     ctermbg=NONE
"call s:h("Directory           ctermfg=12
"call s:h("Title               ctermfg=3     cterm=bold
"call s:h("ErrorMsg            ctermfg=15    ctermbg=1

call s:h("DiffAdd", s:normal_white, s:normal_green, "bold")
call s:h("DiffDelete", s:normal_black, s:bright_red, "")
call s:h("DiffText", s:normal_magenta, s:normal_yellow, "bold")
call s:h("DiffChange", "", "", "")


" Nanii ?
"hi Cursor              ctermfg=1     ctermbg=3
"hi CursorLine          ctermbg=1     cterm=NONE
"hi MatchParen          ctermfg=7     ctermbg=NONE  cterm=underline

" TODO: Future completion
"hi Pmenu               ctermfg=15    ctermbg=0
"hi PmenuThumb          ctermbg=7
"hi PmenuSBar           ctermbg=8
"hi PmenuSel            ctermfg=0     ctermbg=4

" TODO: Spelling
"hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
"hi SpellCap            ctermfg=10    ctermbg=NONE  cterm=underline
"hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
"hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline



" Generic syntax | see :h group-names
" Language general
call s:h("Comment", s:bright_black, "", "")

call s:h("Constant", s:normal_magenta, "", "")
call s:h("String", s:normal_green, "", "")
call s:h("Character", s:normal_green, "", "")
call s:h("Number", s:normal_red, "", "")
call s:h("Boolean", s:normal_magenta, "", "")
call s:h("Float", s:normal_red, "", "")

call s:h("Identifier", s:normal_yellow, "", "")
call s:h("Function", s:normal_blue, "", "")

call s:h("Statement", s:normal_blue, "", "bold")
"call s:h("Conditional", s:undef, "", "")
"call s:h("Repeat", s:undef, "", "")
"call s:h("Label", s:undef, "", "")
"call s:h("Operator", s:undef, "", "")
"call s:h("Keyword", s:undef, "", "")
"call s:h("Exception", s:undef, "", "")
hi! link Operator  Delimiter

call s:h("PreProc", s:normal_blue, "", "")

call s:h("Type", s:normal_green, "", "")
call s:h("StorageClass", s:normal_cyan, "", "bold")
call s:h("Structure", s:normal_cyan, "", "bold")
call s:h("Typedef", s:normal_cyan, "", "")

call s:h("Special", s:normal_blue, "", "")
"hi SpecialChar
"hi Tag
call s:h("Delimiter", s:normal_white, "", "")  " + . = ( ) ...
call s:h("SpecialComment", s:normal_red, "", "")
call s:h("Debug", s:normal_green, "", "")

call s:h("Underlined", s:normal_blue, "", "underline")
call s:h("Ignore", s:normal_black, "", "")
call s:h("Todo", "", s:normal_yellow, "bold,underline")
call s:h("Error", s:normal_red, "", "")
hi! link Error     ErrorMsg
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant
" }}}


" Vim Language {{{
"
call s:h("vimNotation", s:normal_magenta, "", "")   " set
call s:h("vimOption", s:normal_yellow, "", "")      " hidden / mouse / noruler

" Vim statements attempt
call s:h("vimFuncBody", s:normal_cyan, "", "bold")
call s:h("vimNotFunc", s:normal_cyan, "", "bold")

call s:h("vimVar", s:bright_red, "", "")
call s:h("vimFuncVar", s:bright_red, "", "")
" }}}


" HTML {{{
"
call s:h("htmlTag", s:normal_white, "", "")  " < >
call s:h("htmlEndTag", s:normal_white, "", "") " </>
call s:h("htmlTagN", s:normal_cyan, "", "")
call s:h("htmlTagName", s:normal_magenta, "", "")
call s:h("htmlArg", s:normal_yellow, "", "")   " href / class / charset...
"call s:h("htmlBold", s:
call s:h("htmlH1", s:normal_magenta, "", "")
call s:h("htmlH2", s:normal_magenta, "", "")
call s:h("htmlH3", s:normal_magenta, "", "")
call s:h("htmlH4", s:normal_magenta, "", "")
call s:h("htmlH5", s:normal_magenta, "", "")
call s:h("htmlH6", s:normal_magenta, "", "")
"call s:h("htmlItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
"call s:h("htmlLink", { "fg": s:cyan, "gui": "underline", "cterm": "underline" })
"call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
"call s:h("htmlSpecialTagName", { "fg": s:red })
"call s:h("htmlTitle", { "fg": s:white })
" }}}


" One that actually works:
autocmd! bufwritepost monkey.vim source %

" vim:fdm=marker
