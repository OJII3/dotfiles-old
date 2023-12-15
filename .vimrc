" auto install vim plg ==================================================================
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins ===============================================================================

call plug#begin() " Make sure you use single quotes

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
" Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'EdenEast/nightfox.nvim'

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
colorscheme carbonfox


set background=dark

" ================================================================

set number
" set relativenumber
set cursorline
set hlsearch
set incsearch
set smartindent
set clipboard=unnamedplus
set statusline=2
set wildmenu


inoremap jj <Esc>

"fzf
nnoremap <Space>f :Files<CR>
nnoremap <Space>o :History<CR>

"fern
let g:fern#default_hidden=1
nnoremap <Space>e :Fern . -drawer -toggle<CR> 

"vimtex
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}

"coc
noremap <silent> gd <Plug>(coc-definition)<CR>
noremap <silent> gy <Plug>(coc-type-definition)<CR>
noremap <silent> gi <Plug>(coc-implementation)<CR>
noremap <silent> <leader>rn <Plug>(coc-rename)<CR>
noremap <silent> <leader>a <Plug>(coc-codeaction)<CR>
noremap <silent> <leader>c <Plug>(coc-codeacton-cursor)<CR>
noremap <silent> [g <Plug>(coc-diagnostic-prev)<CR>
noremap <silent> ]g <Plug>(coc-diagnostic-next)<CR>
noremap <silent> <leader>fm <Plug>(coc-format)<CR>
