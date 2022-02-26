" My first attempt at theming, still a work in progress
"
" Order picked from vim/desert.vim
set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name='monkey'

let s:fg_black   = 0
let s:fg_red     = 1
let s:fg_green   = 2
let s:fg_yellow  = 3
let s:fg_blue    = 4
let s:fg_magenta = 5
let s:fg_cyan    = 6
let s:fg_white   = 7

let s:bg_black   = 8
let s:bg_red     = 9
let s:bg_green   = 10
let s:bg_yellow  = 11
let s:bg_blue    = 12
let s:bg_magenta = 13
let s:bg_cyan    = 14
let s:bg_white   = 15

"command! -nargs=+ Hi call CustomHighlighter(<f-args>)
"  function! CustomHighlighter(name, ...)
"    let colour_order = ['guifg', 'guibg']
"    let command = 'hi ' . a:name
"    if (len(a:000) < 1) || (len(a:000) > (len(colour_order)))
"      echoerr "No colour or too many colours specified"
"    else
"      for i in range(0,len(a:000)-1)
"        let command .= ' ' . colour_order[i] . '=' . a:000[i]
"      endfor
"    exe command
"  endif
"endfunc


" Generic Syntax
" Each first entry belet s:fore a newline is the group-name match
hi Comment         ctermfg=8

hi Constant        ctermfg=13
hi String          ctermfg=2
hi Character       ctermfg=2
hi Number          ctermfg=1
hi Boolean         ctermfg=5
hi Float           ctermfg=2

hi Identifier      ctermfg=3   cterm=NONE
hi Function        ctermfg=3

hi Statement       ctermfg=6   cterm=bold
"hi Conditional     ctermfg=6
"hi Repeat          ctermfg=6
"hi Label           ctermfg=6
"hi Operator        ctermfg=6
"hi Keyword         ctermfg=6
"hi Exception       ctermfg=6

hi PreProc       ctermfg=4
"hi Include       ctermfg=4
"hi Define        ctermfg=4
"hi Macro         ctermfg=4
"hi PreCondit     ctermfg=4

hi Type            ctermfg=2
hi StorageClass    ctermfg=6
hi Structure       ctermfg=6
hi Typedef         ctermfg=6

hi Special         ctermfg=3
"hi SpecialChar
"hi Tag
hi Delimiter       ctermfg=7   " + . = ( ) ...
"hi SpecialComment  ctermfg=1
"hi Debug           ctermfg=2

hi Underlined      ctermfg=4   cterm=underline
hi Ignore          ctermfg=0
hi Todo            ctermfg=15  ctermbg=NONE     cterm=bold,underline
hi Error           ctermfg=1

hi! link Operator  Delimiter
hi! link Error     ErrorMsg
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant




hi Normal              ctermfg=7
"hi Cursor              ctermfg=1     ctermbg=1
"hi CursorLine          ctermbg=2     cterm=NONE
hi MatchParen          ctermfg=7     ctermbg=NONE  cterm=underline

hi Pmenu               ctermfg=15    ctermbg=0
hi PmenuThumb          ctermbg=7
hi PmenuSBar           ctermbg=8
hi PmenuSel            ctermfg=0     ctermbg=4
hi ColorColumn         ctermbg=0
hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=10    ctermbg=NONE  cterm=underline
hi SpellRare           ctermfg=11    ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=13    ctermbg=NONE  cterm=underline
hi NonText             ctermfg=8
hi LineNr              ctermfg=8     ctermbg=NONE
hi CursorLineNr        ctermfg=11    ctermbg=0
hi Visual              ctermfg=0     ctermbg=12
hi IncSearch           ctermfg=0     ctermbg=13    cterm=NONE
hi Search              ctermfg=0     ctermbg=10
hi StatusLine          ctermfg=7     ctermbg=0     cterm=bold
hi StatusLineNC        ctermfg=8     ctermbg=0     cterm=bold
hi VertSplit           ctermfg=0     ctermbg=0     cterm=NONE
hi TabLine             ctermfg=8     ctermbg=0     cterm=NONE
hi TabLineSel          ctermfg=7     ctermbg=0
hi Folded              ctermfg=6     ctermbg=0     cterm=bold
hi Conceal             ctermfg=6     ctermbg=NONE
hi Directory           ctermfg=12
hi Title               ctermfg=3     cterm=bold
hi ErrorMsg            ctermfg=15    ctermbg=1
hi DiffAdd             ctermfg=0     ctermbg=2
hi DiffChange          ctermfg=0     ctermbg=3
hi DiffDelete          ctermfg=0     ctermbg=1
hi DiffText            ctermfg=0     ctermbg=11    cterm=bold
" C/C++ Specific

