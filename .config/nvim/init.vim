let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'mbbill/undotree'                      " undo tree
    Plug 'hrsh7th/cmp-nvim-lsp'                 " lsp
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'rhysd/vim-clang-format'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'terryma/vim-multiple-cursors'
    Plug 'alvan/vim-closetag'
    Plug 'windwp/nvim-autopairs'                 " autopairs
    " Plug 'Jorengarenar/miniSnip'                 " snippets
    Plug 'tpope/vim-commentary'                  " comments
    "Plug 'kien/ctrlp.vim'                      " fuzzy finder
    "Plug 'junegunn/fzf.vim'                    " fuzzy finder
    "Plug 'preservim/nerdtree'                  " file browser
    Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' } " realtime live server
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'ap/vim-css-color'                     " hex colours show
    Plug 'gruvbox-community/gruvbox'            "gruvbox theme
    Plug 'arcticicestudio/nord-vim'             " nord theme
    Plug 'AlexvZyl/nordic.nvim'                 " nordic theme
    "Plug 'tpope/vim-surround'
    "Plug 'tpope/vim-fugitive'                  " git
    " Plug 'jreybert/vimagit'                   " git
call plug#end()

"coc config
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ ]

" status bar config
" set termguicolors

set laststatus=2
set statusline=                                        "Reset

set statusline+=\ %t\                                  "Tail
set statusline+=\ %m\                                  "Modified
set statusline+=\ %=%y\                                "FileType


"clang formatter config
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false"}

autocmd BufWritePre *.ts execute "silent %!npx prettier --stdin-filepath '" . expand('%:p') . "'"
"autocmd FileType c,cpp ClangFormatAutoEnable
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"let g:clang_format#auto_format=1
set title
" set bg=light
" set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set noshowcmd


" Some basics:

" set background=dark
colorscheme nord
let g:move_key_modifier = 'A'
hi Visual term=reverse cterm=reverse
"hi Normal guibg=NONE ctermbg=NONE
set hlsearch
set number relativenumber
set incsearch
set clipboard=unnamedplus
" disable mouse context menu (right click)
set mousemodel=extend
"def = 4 like = 2 :) / 3 :|
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix
set nocompatible
set encoding=utf-8
set wildmode=longest,list,full
set splitbelow splitright
set hidden
" set highlight all found words and map enter key to clear highlight
set hlsearch
nnoremap <CR> :noh<CR>
"set nowrap
set wrap
set breakindent
set noerrorbells
let &showbreak=' '
set smartindent
set smartcase
set ignorecase
set scrolloff=8
set signcolumn=yes
" set colorcolumn=80
set cmdheight=2
set noshowmode
set listchars=trail:-
nnoremap c "_c
set nocompatible
filetype plugin on
syntax enable
set encoding=utf-8
set number relativenumber
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
vnoremap . :normal .<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, unlike vim defaults.
set splitbelow splitright

" Undo tree
nnoremap <A-r> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1

" Nerd tree
" map <A-r> :NERDTreeToggle<CR>
"if has('nvim')
"let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
"else
"let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
"endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace ex mode with gq
map Q gq

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

" Replace (all) (in line) is aliased to S.
nnoremap S :s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
"map <leader>c :w! \| !compiler "<c-r>%"<CR>

"compile cpp and run
nmap <leader>cpp <esc>:term g++ -O2 -Wall *.cpp -o output && ./output<CR> :norm i<CR>
nmap <leader>cp <esc>:term gcc -O2 -Wall *.c -o output && ./output<CR> :norm i<CR>
vmap <leader>cf <esc>:'<,'>ClangFormat<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let lineNumb = line('.')
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
"autocmd BufWritePre * cal cursor(lineNumb,0)

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
" run xbindkeys --poll-rc (updates xbindkeys rc) on nvim save.
autocmd BufWritePost ~/.xbindkeysrc !cd ~; xbindkeys --poll-rc
" set a new pid for dunst to reload it
"autocmd BufWritePost ~/.config/dunst/dunstrc !dunst &
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>
nnoremap <c-a> <esc><esc>ggVG<CR>
map <C-s> :w<CR>
noremap j gj
noremap k gk

"
nmap da :ALEDetail<CR>

" Commentary stuff
vmap ff :Commentary<CR>
nmap ff :Commentary<CR>
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

hi statusline ctermfg=darkblue ctermbg=0
