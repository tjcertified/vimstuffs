set nocompatible
syntax enable
set showcmd
set omnifunc=syntaxcomplete#Complete
color molokai


" Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set expandtab
set backspace=indent,eol,start
set autoindent
set relativenumber
set undofile
set ttyfast
set ruler
set visualbell
set wildmenu
set hidden
set wildmode=list:longest
set cursorline

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set colorcolumn=80

""<Esc> Alternate
inoremap <S-CR> <Esc>
inoremap jk <Esc>

"" Set capital w to save
command! W w
let mapleader = ","

"" lets <,><space> get rid of search highlights
nnoremap <leader><space> :noh<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

""Syntax for VB.Net files automatically
autocmd BufNewFile,BufRead *.vb set ft=vbnet

"" Set dirs
set backupdir=~/bkp//
set undodir=~/undo//
set dir=~/bkp//
