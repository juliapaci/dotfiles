let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
"Plug 'tpope/vim-commentary'
" smart vim
Plug 'rhysd/vim-clang-format'
"Plug 'codota/tabnine-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'https://github.com/bfrg/vim-cpp-modern'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
" auto
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
" auto commenter
Plug 'preservim/nerdcommenter'
 "git
"Plug 'tpope/vim-fugitive'
 "help
Plug 'vimwiki/vimwiki'
call plug#end()
 "Disable function highlighting (affects both C and C++ files)
"let g:cpp_function_highlight = 0

 "Enable highlighting of C++11 attributes
"let g:cpp_attributes_highlight = 1

 "Highlight struct/class member variables (affects both C and C++ files)
"let g:cpp_member_highlight = 1

 "Put all standard C and C++ keywords under Vim's highlight group 'Statement'
 "(affects both C and C++ files)
"let g:cpp_simple_highlight = 1
"let g:cpp_class_scope_highlight=1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_experimental_template_highlight = 1

 "coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

"lightline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }"set bg=dark

"clang formatter config
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false"}

autocmd BufWritePre *.ts execute "silent %!npx prettier --stdin-filepath '" . expand('%:p') . "'"
"autocmd FileType c,cpp ClangFormatAutoEnable
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"let g:clang_format#auto_format=1
set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Some basics:

"set background=dark
colorscheme nord
"colorscheme gruvbox
let g:move_key_modifier = 'A'
"hi Normal guibg=NONE ctermbg=NONE
set hlsearch
set laststatus=2
set number relativenumber
set incsearch
set clipboard=unnamedplus
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
set nohlsearch
"set nowrap
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
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax enable
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
    map <A-r> :NERDTreeToggle<CR>
    "map <leader>r :NERDTreeToggle<CR>
    "if has('nvim')
        "let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    "else
        "let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    "endif

" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	"map <leader>c :w! \| !compiler "<c-r>%"<CR>

  "compile cpp and run
  "autocmd filetype cpp nnoremap <leader>cp :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
  "autocmd filetype cpp nnoremap <leader>cp :w <bar> exec 'term g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
  nmap <leader>cp <esc>:term g++ -O2 -Wall *.cpp -o output && ./output<CR> :norm i<CR>
  map <leader>cf <esc>:ClangFormat<CR>

  " Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
  "autocmd BufWritePre * let lineNumb = line('.')
  autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
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
vmap ff <plug>NERDCommenterToggle
nmap ff <plug>NERDCommenterToggle
map <C-s> :w<CR>
nnoremap j gj
nnoremap k gk
