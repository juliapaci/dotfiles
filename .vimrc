" SWITCHED TO NVIM SEE INIT.VIM!!!!!!!!!!!!!!!












let mapleader=" "
" vim-plug

call plug#begin('~/.vim/vim-plug')
" smart vim (auto completion, auto formatter, multiple cursors)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'terryma/vim-multiple-cursors'
" fuzzy finder & file tree
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
" live server/edit
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }
" syntax
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" themes + things for look nice points :)
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
" auto pairs
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" auto commenter
Plug 'preservim/nerdcommenter'
" git
Plug 'tpope/vim-fugitive'
" help
Plug 'vimwiki/vimwiki'
call plug#end()

" scripts

 "coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

"lightline
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }"set bg=dark

"alt fix (only add if Control+V followed by ALT-x shows ^[x (in terminal))
for i in range(97,122)
  let c = nr2char(i)
  exec "map \e".c." <M-".c.">"
  exec "map! \e".c." <M-".c.">"
endfor


" settings

autocmd BufWritePre *.ts execute "silent %!npx prettier --stdin-filepath '" . expand('%:p') . "'"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
syntax enable 
"set background=dark
colorscheme gruvbox 
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
" move fast up and down
nnoremap <silent> <c-k> <c-u>
nnoremap <silent> <c-j> <c-d>
" create tab and quit hotkeys
nnoremap <silent> <C-t> :tabnew<CR> 
" select all
nnoremap <c-a> <esc><esc>ggVG<CR>
" auto save
map <C-s> :w<CR>
 "move lines around 
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
" copy and paste
map ,, "+y
"move around tabs
map <A-l> :tabn<CR>
map <A-h> :tabp<CR>
"file tree
map <A-r> :NERDTreeToggle<CR>
" comment toggle
vmap ff <plug>NERDCommenterToggle
nmap ff <plug>NERDCommenterToggle
" help for my .vimrc (workign progress)
" <leader>ww
