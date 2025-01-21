" An attempt to extend netrw with ryanoasis/devicons, credits to that guy:
" https://gist.github.com/AndrewRadev/ea55ba1923da3f5074cad06144e8aed3
" -> Unfortunately, this is not so convenient and hacky as he said it himself:
" https://www.reddit.com/r/vim/comments/1fdetb1/a_plugin_for_file_icons_in_netrw
"
" ``Copied from the above link in case the following is lost:``
"
" This is not a direct translation, but a different way to pull this off. The
" way that I'm adding the icons is by using :help text-properties, and the way
" I'm jumping from node to node is by using :help search() with a check for the
" syntax of the word under the cursor -- if it's netrwPlain or netrwDir, I ask
" netrw for the node name with netrw#GX() and then decide whether it's a
" directory or not for the icon. There's probably issues: for instance, the
" original plugin checks for symlinks, and I didn't put the time to handle
" those in some special way.
"
" If you also install this plugin, you should get fancy icons:
" https://github.com/ryanoasis/vim-devicons. I've added a check for their
" function WebDevIconsGetFileTypeSymbol, which should return the right filetype
" icon. However, I do not have the required patched fonts installed, so I can't
" really tell if it's working correctly 😅. I would say you could consider this
" as a starting point, but I'm afraid I don't have a maintained, fully-working
" out of the box solution, and since I don't use netrw myself (or use patched
" fonts), even if I got it to work, I wouldn't keep up with maintenance on it
" (basically, Tim Pope's thoughts on this issue).
"
" It's possible that vim-devicons will natively support this, but the issue
" hasn't been active in a while:
" https://github.com/ryanoasis/vim-devicons/issues/272
"
" In general, netrw is a bit difficult to fiddle with, at least for me. For
" instance, for some reason it loses icons on FocusLost, and I don't understand
" why (but then they show up again on cursor move, still don't understand why).
" I would say there shouldn't be any fundamental problems to rewrite the
" original plugin in Vimscript, there's nothing special going on in the code.
" The author uses a Neovim-specific autocommand, BufModifiedSet, so maybe that
" one is more reliable for netrw in particular (I use TextChanged)? But the
" problem is having someone to maintain the code and fix issues as they show up
" --

" This is not used.
finish

" The following is the gist itself, in case it would disappear - Sep. 29th 2024
" Save as ~/.vim/ftplugin/netrw_icons.vim

if exists('b:netrw_icons_loaded')
  finish
endif
let b:netrw_icons_loaded = 1

autocmd TextChanged <buffer> call s:NetrwAddIcons()

if empty(prop_type_get('netrw_file_icon', {'bufnr': bufnr('%')}))
  call prop_type_add('netrw_file_icon', {
        \ 'bufnr':   bufnr('%'),
        \ 'combine': v:true
        \ })
endif

let s:skip = 'synIDattr(synID(line("."), col("."), 0), "name") !~ "netrwDir\\|netrwExe\\|netrwSymLink\\|netrwPlain"'

function s:NetrwAddIcons() abort
  if !exists('b:netrw_curdir')
    return
  endif

  " Clear out any previous matches
  call prop_remove({'type': 'netrw_file_icon', 'all': v:true})

  let saved_view = winsaveview()
  defer winrestview(saved_view)

  let current_dir = b:netrw_curdir

  " Keep track of nodes we've already annotated:
  let seen = {}

  " Start from the beginning of the file
  normal! gg0

  let pattern = '\f\+'

  if get(b:, 'netrw_liststyle') == 1
    " The timestamps shown at the side should not be iterated, so let's take
    " the list of files to determine what the last column should be:
    let files = readdir(current_dir)
    let max_length = max(map(files, {_, f -> len(f)}))

    let max_col = max_length + 2
    let pattern = '\f\+\%<'..max_col..'c'
  endif

  while search(pattern, 'W', 0, 0, s:skip) > 0
    let pos = getpos('.')
    let node = netrw#GX()
    call setpos('.', pos)

    if node =~ '/$'
      let is_dir = 1
    else
      let is_dir = 0
    endif

    if s:CurrentSyntaxName() == 'netrwSymLink'
      let is_symlink = 1
    else
      let is_symlink = 0
    endif

    if exists('*WebDevIconsGetFileTypeSymbol')
      let symbol = WebDevIconsGetFileTypeSymbol(b:netrw_curdir..'/'..node, is_dir)
    elseif is_symlink
      let symbol = '🔗'
    elseif is_dir
      let symbol = '📁'
    else
      let symbol = '📄'
    endif

    if symbol != ''
      call prop_add(line('.'), col('.'), {
            \ 'type': 'netrw_file_icon',
            \ 'text': symbol..' ',
            \ })
    endif

    " move to the end of the node
    call search('\V'..escape(node, '\'), 'We', line('.'))

    if is_symlink
      " if there's a -->, then the view is long and we can just go to the end
      " of the line
      if search('\s\+-->\s*\f\+', 'Wn', line('.'))
        normal! $
      endif
    endif
  endwhile
endfunction

function! s:CurrentSyntaxName() abort
  return synIDattr(synID(line("."), col("."), 0), "name")
endfunction
