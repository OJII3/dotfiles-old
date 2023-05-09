" Dein settings ======================================================
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir = expand('$HOME/.vim')
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, { 'lazy': 0 })
  call dein#load_toml(s:lazy_toml, { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif


" Other options ======================================================

set number
set updatetime=50

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a <Plug>(coc-codeaction-selected)

