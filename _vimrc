"" Vim settings

" set all files to be interpreted as utf-8
set encoding=utf-8
" set THIS file to be interpreted as utf-8
" (allows whitespace chars to appear correctly)
scriptencoding utf-8

" set the color scheme
color molokai

" set font
set guifont=Consolas_for_Powerline_FixedD:h11

" enable syntax highlighting
syntax on
syntax enable

" disable vi-compatible mode, enabling more vim features
set nocompatible
filetype off

" Whitespace
" Turn line wrapping off
set nowrap
" convert tabs to spaces
set expandtab
" Set Default tabstop to two spaces
set tabstop=2
" shiftwidth applies when >> operator is used.
set shiftwidth=2
" shiftround makes shifts happen in multiples of the 'shiftwidth' value
set shiftround
" allow backspace over autoindent, line breaks, and start of insert
set backspace=indent,eol,start
" use indentation of current line for next line
set autoindent
" show whitespaces
set list listchars=tab:··,trail:●,extends:⮀,precedes:⮂

" Set line number on left relatively.
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

"" Search options
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
set backupdir=~\bkp\
set undodir=~\bkp\
set dir=~\bkp\

"" Code-folding
" Set code-folding somewhat appropriately
set foldmethod=indent
" turn off automatic code-folding when opening a file
set nofoldenable

" For complex commands, show what state you are in the command
" e.g. if typing '2dw' (delete two words), until the 'w' is pressed
" all other parts are shown in the bottom line
set showcmd
set omnifunc=syntaxcomplete#Complete

" find all code
set path=.,..,/code/bci-i/trunk/**,shared

" show 3 lines of code around cursor (top or bottom), when possible
set scrolloff=3

" setup Vundle
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle/')

" let Vundle manage Vundle (required) and add all plugins
Plugin 'VundleVim/vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'alvan/vim-closetag'
Plugin 'ervandew/supertab'
Plugin 'rip-rip/clang_complete'
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'mileszs/ack.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'a.vim'
call vundle#end()

"" Turn filetype on for Vundle to work
filetype plugin indent on

"" Set mapleader to , instead of \ for ease
let mapleader = ","

" for CtrlP plugin;
set runtimepath^=~/vimfiles/bundle/ctrlp.vim

" Change default CtrlP function to mixed (search paths, buffers,
" and MostRecentlyUsed
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1


"""KEY REMAPPINGS
" remap 'jk' to Esc (to leave insert mode easily)
inoremap jk <Esc>
inoremap JK <Esc>
" Use movements to navigate split panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Use plugin for undo tree, and map toggle function to F5
" NOTE: requires Python 2.7.6, x86 version
nnoremap <F5> :GundoToggle<CR>
" set buffer shortcut navigations
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
" random keybindings for ease
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap ZQ :bd<CR>
nnoremap <F10> :SyntasticToggleMode<CR>

"" Leader Mappings
" lets <,><space> get rid of search highlights
nnoremap <silent> <leader><space> :noh<cr>
" let <,><pc> remove 'Preview' window
nnoremap <silent> <Leader>pc :pc<cr>

" keybindings for cscope
"s: Find this C symbol
nnoremap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
"g: Find this definition
nnoremap <Leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: Find functions calling this function
nnoremap <Leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: Find this text string
nnoremap <Leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
"e: Find this egrep pattern
nnoremap <Leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: Find this file
nnoremap <Leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: Find files #including this file
nnoremap <Leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR
"d: Find functions called by this function
nnoremap <Leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

"" Commands
" Set capital w to save
command! W w
" Set capital q to quit
command! Q q
" let VBD close single pane in vertical-split mode
command! VBD execute "bp|bd #"

"" Setup Airline extension
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" Enable buffer-line from Airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
set laststatus=2
" Add linecount to Airline
call airline#parts#define_raw('lineno', '%L ')
call airline#parts#define_raw('columnno', ':%3v')
call airline#parts#define_accent('columnno', 'italic')
function! AirlineAddLinecount()
  let g:airline_section_z = airline#section#create(['windowswap', 'linenr', '/', 'lineno', 'columnno'])
endfunction
autocmd VimEnter * call AirlineAddLinecount()

" Enable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = 'passive'
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { "level": "warning" }

"" Ctags options
" look recursively for tags file
set tags=tags;
" change keybindings for navigating tags
let g:clang_library_path = "C:\\Program Files\\LLVM\\bin"
let g:clang_user_options = "|| exit 0"
" make completion go faster by eliminating include files
set complete-=i

" workaround for autopairs+clang_complete
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

"settings for rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" settings for Trane/ BCI-I work
cd c:\code\bci-i\trunk\source\
cs add \code\bci-i\trunk\source\cscope.out

