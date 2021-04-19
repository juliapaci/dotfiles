" vim-plug
let mapleader=" "

call plug#begin('~/.vim/vim-plug')
Plug 'rakr/vim-one'
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

" scripts
" lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }"set bg=dark
"alt fix
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor


" settings
syntax enable 
"set background=dark
colorscheme onedark 
let g:move_key_modifier = 'A'
"hi Normal guibg=NONE ctermbg=NONE
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
set listchars=trail:-

" maps
nnoremap <silent> <c-k> <c-u>
nnoremap <silent> <c-j> <c-d>  
nnoremap <silent> <C-t> :tabnew<CR> 
nnoremap <silent> <C-w> :quit<CR>
map <S-insert> <C-i>
map <c-a> <esc><esc>ggVG<CR>
map <c-s> :w<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
