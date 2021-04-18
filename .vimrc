" vim-plug
let mapleader=" "

call plug#begin('~/.vim/vim-plug')
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
call plug#end()
colorscheme onedark

" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }"set bg=dark

"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      "\ },
      "\ 'component': {
      "\   'helloworld': 'Hello, world!'
      "\ },
      "\ }
" settings
syntax on
set hlsearch
set laststatus=2
set number relativenumber
set incsearch
set clipboard=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix 
set nocompatible
set encoding=utf-8
set wildmode=longest,list,full
set splitbelow splitright
set hidden
set nohlsearch
set nowrap
set noerrorbells
set smartindent
set smartcase
set ignorecase
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set noshowmode

" maps
nnoremap <silent> <c-k> <c-u>
nnoremap <silent> <c-j> <c-d>  
nnoremap <silent> <C-t> :tabnew<CR> 
nnoremap <silent> <C-w> :quit<CR>
map <S-insert> <C-i>
map <c-a> <esc><esc>ggVG<CR>
map <c-s> :w<CR>
" map <c-/> 
