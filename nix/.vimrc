"" Load all bundles
call pathogen#runtime_append_all_bundles()

"" Set mapleader here for NERDCommenter to work
let mapleader = ","

"" Turn filetype off, then on for pathogen to work
filetype off
filetype plugin indent on

" for CtrlP plugin;
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Change default CtrlP function to mixed (search paths, buffers,
" and...something else
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1

" enable syntax highlighting
syntax on
syntax enable

" disable vi-compatible mode, enabling more vim features
set nocompatible

"""KEY REMAPPINGS
" remap 'jk' to Esc (to leave insert mode easily)
inoremap jk <Esc>

" Set capital w to save
command! W w

" Set capital q to quit
command! Q q

" Change leader key from slash to comma
let mapleader = ","

"" lets <,><space> get rid of search highlights
nnoremap <leader><space> :noh<cr>
"nnoremap <leader>w <C-w>v<C-w>l

" Use movements to navigate split panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Use plugin for undo tree, and map toggle function to F5
" NOTE: requires Python 2.7.6, x86 version
nnoremap <F5> :GundoToggle<CR>

" For complex commands, show what state you are in the command
" e.g. if typing '2dw' (delete two words), until the 'w' is pressed
" all other parts are shown in the bottom line
set showcmd
set omnifunc=syntaxcomplete#Complete

" set the color scheme
color molokai

" Whitespace
" Turn line wrapping off
set nowrap

" convert tabs to spaces
set expandtab

" Set Default tabstop to four spaces
set tabstop=4 

" shiftwidth applies when >> operator is used.
set shiftwidth=4

" shiftround makes shifts happen in multiples of the 'shiftwidth' value
set shiftround

" allow backspace over autoindent, line breaks, and start of insert
set backspace=indent,eol,start

" use indentation of current line for next line
set autoindent

" Set line number on left relatively.
" Can still see current line in status line (bottom)
set relativenumber

" Show line number on current line instead of '0'
set number

" persistent undo saved to a file in dir listed below
set undofile

" makes vim work faster. tty is old mode from vi
set ttyfast

" Show current line and column of cursor
set ruler

" Make screen flash instead of audio warning for improper actions
set visualbell

" let buffers remain in the list
set hidden

" kind of like intellisense for command-line mode
set wildmode=list:longest,full

" highlight the current line
set cursorline

" highlight the current search
set hlsearch

" perform search incrementally
set incsearch

" find both cases when searching
set ignorecase

" when you search, uppercase means you mean uppercase
set smartcase

" use global replacement for searches
set gdefault

" Show opposite parens when typing the other.
set showmatch

" color the 80th column for a guideline for line length
set colorcolumn=80

"" Set dirs
set backupdir=~/bkp//
set undodir=~/undo//
set dir=~/bkp//

" Set code-folding somewhat appropriately
set foldmethod=syntax

" turn off automatic code-folding when opening a file
set nofoldenable


" Enable 'VimAirline' extension
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Enable Syntastic
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
