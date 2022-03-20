" My custom theme, more like grouping my favorite likings.
" I made this file to easily switch between my favorite palettes

" Inspiration:
" Has a really clean and minimal structure to study
" https://github.com/romainl/Apprentice/blob/master/colors/apprentice.vim
" Jellybeans also is super well written with functionality on top
" nanotech/jellybeans.vim/blob/master/colors/jellybeans.vim

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='monkey'

" My favorite palettes
" {{{

" my Favorites for sure:
"
" Base16-eighties
" OneDark
" Material

" ToExplore:
" OceanicNext


" Palette : base16-eighties
" gray shades:
" 2d2d2d
" 393939
" 515151
" 747369
" a09f93
" d3d0c8
" e8e6df
" f2f0ec
"
" }}}

  " [Editor]
  let s:background  = { "gui": "#2d2d2d", "cli": "237" }
  let s:foreground  = { "gui": "#e8e6df", "cli": "7" }
  let s:black       = { "gui": "#282c34", "cli": "0" }  " For high contrast
  let s:columnMark  = { "gui": "#333333", "cli": "237" }
  let s:comment     = { "gui": "#515151", "cli": "8" }
  let s:lineNumbers = { "gui": "#747369", "cli": "237" }
  let s:selection   = s:lineNumbers

  " [Content]
  let s:includes    = { "gui": "#6699cc", "cli": "3" }  " require, import
  let s:functions   = s:includes                        " func()
  let s:variables   = { "gui": "#ffcc66", "cli": "3" }  " variable=
  let s:numbers     = { "gui": "#f99157", "cli": "3" }  " 123
  let s:constants   = s:numbers                         " NULL, True, False
  let s:strings     = { "gui": "#99cc99", "cli": "2" }  " and chars
  let s:statements  = { "gui": "#cc99cc", "cli": "6" }  " if, return, try
  let s:escSequences= { "gui": "#66cccc", "cli": "3" }  " \033
  let s:decorators  = s:escSequences                    " @somethinG

  let s:diffAdd     = { "gui": "#225925", "cli": "9" }
  let s:diffDelete  = { "gui": "#a42a28", "cli": "9" }
  let s:diffChange  = { "gui": "#cc7400", "cli": "9" }
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


" Highlight settings
" Editor
" {{{
  call s:h("ColorColumn",  "", s:columnMark, "")   " Vert. marker 80 col
  call s:h("DiffAdd",      "", s:diffAdd, "")
  call s:h("DiffChange",   "", s:diffChange, "")
  call s:h("DiffDelete",   "", s:diffDelete, "")
  call s:h("DiffText",     "", s:diffText, "")
  call s:h("Directory",    s:includes, "", "")  " NERDTree && :e <tab><tab>
  call s:h("ErrorMsg",     "", s:diffDelete, "")
  call s:h("Folded",       s:comment, "", "bold")  " Folds default closing
  call s:h("IncSearch",    s:black, s:includes, "")
  call s:h("LineNr",       s:lineNumbers, "", "")  " Vert. numbers
  call s:h("MatchParen",   "", s:escSequences, "")
  call s:h("NonText",      s:lineNumbers, "", "")  " '~' in end of file
  call s:h("Normal",       s:foreground, s:background, "")
  call s:h("Pmenu",        s:foreground, s:lineNumbers, "")
  call s:h("PmenuSBar",    "", s:escSequences, "")
  call s:h("PmenuSel",     s:black, s:variables, "")
  call s:h("PmenuThumb",   "", s:escSequences, "")
  call s:h("Search",       s:black, s:variables, "")
  call s:h("StatusLine",   "", s:comment, "") " Appear between 2 airline panes
  call s:h("StatusLineNC", "", s:black, "") " Appear as ^^^ for current pane
  call s:h("VertSplit",    s:black, s:comment, "") " Appear between 2 airline panes
  call s:h("Visual",       "", s:selection, "")    " Visual selection look
  " Not in use (at least for now)
  " ____________________________
  " TabLine     | }
  " TabLineSel  | }} Those are managed by [light/air]line
  " TabLineFill | }
  " Conceal     | To turn `lambda` into lambda sign
  " Title       | :set all | :autocmd
  " }}}

call s:h("Boolean",        s:constants, "", "")
call s:h("Character",      s:strings, "", "")
call s:h("Comment",        s:comment, "", "")
call s:h("Constant",       s:constants, "", "")  " NULL
call s:h("Debug",          s:strings, "", "")
call s:h("Delimiter",      s:foreground, "", "")  " + . = ( ) ...
call s:h("Error",          s:numbers, "", "")
call s:h("Float",          s:numbers, "", "")
call s:h("Function",       s:functions, "", "")     " def _Function_
call s:h("Identifier",     s:variables, "", "")   " Var name
call s:h("Ignore",         s:black, "", "")
call s:h("Number",         s:numbers, "", "")
call s:h("PreProc",        s:functions, "", "")
call s:h("Special",        s:functions, "", "")
call s:h("SpecialComment", s:numbers, "", "")
call s:h("Statement",      s:statements, "", "bold")
call s:h("StorageClass",   s:strings, "", "bold")
call s:h("String",         s:strings, "", "")
call s:h("Structure",      s:strings, "", "bold")
call s:h("Todo",           s:black, s:variables, "bold,underline")
call s:h("Type",           s:strings, "", "")
call s:h("Typedef",        s:strings, "", "bold")
call s:h("Underlined",     s:functions, "", "underline")

hi! link Error     ErrorMsg
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant
" + - = are white
hi! link Operator  Delimiter


" Languages
" {{{ Vim
call s:h("vimNotation",   s:constants, "", "")     " vim keywords | set/call...
call s:h("vimOption",     s:numbers, "", "")       " hidden / mouse / noruler

call s:h("vimFunction",   s:functions, "", "bold")

call s:h("vimCommand",   s:functions, "", "bold")
call s:h("vimFuncKey",   s:functions, "", "bold")
call s:h("vimNotFunc",    s:functions, "", "bold")

call s:h("vimVar",        s:variables, "", "")
call s:h("vimFuncVar",    s:numbers, "", "")
" }}}


" HTML {{{
"
call s:h("htmlTag", s:foreground, "", "")  " < >
call s:h("htmlEndTag", s:foreground, "", "") " </>
call s:h("htmlTagN", s:statements, "", "")
call s:h("htmlTagName", s:constants, "", "")
call s:h("htmlArg", s:numbers, "", "")   " href / class / charset...
"call s:h("htmlBold", s:
call s:h("htmlH1", s:constants, "", "")
call s:h("htmlH2", s:constants, "", "")
call s:h("htmlH3", s:constants, "", "")
call s:h("htmlH4", s:constants, "", "")
call s:h("htmlH5", s:constants, "", "")
call s:h("htmlH6", s:constants, "", "")
"call s:h("htmlItalic", { "fg": s:constants, "gui": "italic", "cterm": "italic" })
"call s:h("htmlLink", { "fg": s:statements, "gui": "underline", "cterm": "underline" })
"call s:h("htmlSpecialChar", { "fg": s:dark_numbers })
"call s:h("htmlSpecialTagName", { "fg": s:numbers })
"call s:h("htmlTitle", { "fg": s:white })
" }}}


" vim:fdm=marker
