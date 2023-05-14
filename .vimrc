" auto install vim plg ==================================================================
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins ===============================================================================

call plug#begin() " Make sure you use single quotes

Plug 'altercation/vim-colors-solarized'
Plug 'prabirshrestha/vim-lsp'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" colorscheme  ==================================================================================

syntax on
colorscheme solarized

" ================================================================

set number
set relativenumber
set cursorline
set hlsearch
set incsearch
set smartindent
set clipboard+=unnamed
set statusline=2
set wildmenu

nnoremap <Space>e :NERDTreeToggle<CR> 

" lsp      ==========================================================================

if (executable('pylsp'))
	au User lsp_setup call lsp#register_server({
		\ 'name': 'pylsp',
		\ 'cmd': {server_info->['pylsp']},
		\ 'allowlist': ['python']
		\ })
endif


function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	nmap <buffer> <leader>gd <plug>(lsp-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
endfunction

augroup lsp_insall
	au!
	autocmd User lsp_buffer_enanbled call s:on_lsp_buffer_enabled()
augroup END


