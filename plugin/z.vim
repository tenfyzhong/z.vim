"
" z.vim
"
" Last Change:  Tue Mai  28 03:40:28 EDT 2013
" Maintainer:   Henrik Kjelsberg <hkjels@me.com> (http://take.no/)
" License:      MIT
"

if exists("g:loaded_z")
  finish
endif
let g:loaded_z = 1

" `z`-native preferences

if exists("g:z_data")
  let $_Z_DATA = resolve(expand(g:z_data))
endif
if exists("g:z_no_resolve_symlinks")
  let $_Z_NO_RESOLVE_SYMLINKS = g:z_no_resolve_symlinks
endif
if exists("g:z_exclude_dirs")
  let $_Z_EXCLUDE_DIRS = g:z_exclude_dirs
endif


" Takes a list of regular expressions and returns a list
" of paths and weights.

let s:z_sh = expand('<sfile>:p') . '.sh'

fun! s:list(list)
  let regexes = shellescape(join(a:list))
  let list = split(system(s:z_sh . '  -l ' . regexes), '\n')
  return list
endfun


" Takes a string "weight directory" and returns a
" resolved path.

fun! s:pickDir(line)
  let directory = resolve(expand(join(split(a:line)[1:], '\\ ')))
  return directory
endfun


" cd to the selected path
fun! s:InteractiveCd(cmd)
    let content = getline('.')
    let ZDIR = <SID>pickDir(content)
    q
    silent exec a:cmd . ' ' . ZDIR
    echo ZDIR
endfun

" Create an interactive non-modifiable buffer with the list of
" directories that match the regexes passed if any.
fun! s:InteractiveList(...)
  " Set up window and buffer
  10new
  set buftype=nofile bufhidden=hide
  setlocal noswapfile
  call append(0, s:list(a:000))

  " No matches
  if (line2byte(line('$') + 1) == -1)
    echo '`z` found no matches for your query'
    return
  endif

  %s@\n\n@@g
  setlocal nomodifiable
  0

  " Syntax highlighting
  syn match Zratio "^[0-9\.]*"
  syn match Zdirectory "[\.A-Za-z-]*$"
  hi def link Zratio Number
  hi def link Zdirectory Special

  " Keystrokes for opening the highlighted directory in a new window
  " or simply `cd` into it.
  " NOTE: These mappings might not be final. I'll have to check out some
  "       best practises. Also the mapping itself is pretty ugly.

  noremap <buffer> <silent> <enter> :call <SID>InteractiveCd('cd')<cr>
  noremap <buffer> <silent> v :call <SID>InteractiveCd('vs')<cr>
  noremap <buffer> <silent> s :call <SID>InteractiveCd('sp')<cr>
endfun


" Set most frecent directory as CWD

fun! s:QuickJump(...)
  try
    let info = s:list(a:000)[0]
  catch
    echo '`z` found no matches for your query'
    return
  endtry
  let directory = s:pickDir(info)
  exec 'cd '.directory
  echo directory
endfun


" Interface exposed to the user

command! -nargs=* Zl call s:InteractiveList(<f-args>)
command! -nargs=* Z call s:QuickJump(<f-args>)

