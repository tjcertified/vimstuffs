"" VIM settings
" set all files to be interpreted as utf-8
set encoding=utf-8
" set THIS file to be interpreted as utf-8
" (allows whitespace chars to appear correctly)
scriptencoding utf-8

" make gVim handle everything via console
set guioptions+=c

" set font
set guifont=FantasqueSansMono_NF:h12:cANSI
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
set tabstop=4
" shiftwidth applies when >> operator is used.
set shiftwidth=4
" shiftround makes shifts happen in multiples of the 'shiftwidth' value
set shiftround
" allow backspace over autoindent, line breaks, and start of insert
set backspace=indent,eol,start
" use indentation of current line for next line
set autoindent
" show whitespaces
" set list listchars=tab:··,trail:●,extends:⮀,precedes:⮂
set list listchars=tab:··,trail:●,extends:,precedes:

" Set line number on left relative lines away from current.
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
" set spell-checking
set spell spelllang=en_us

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
" don't look for things in cscope db's or Rhapsody files
set wildignore+=cscope.out,*.rpy,tags

" Show opposite parens when typing the other.
set showmatch
" color the 80th column for a guideline for line length
set colorcolumn=80

"" Set dirs
set backupdir=~\bkp\\
set undodir=~\bkp\\
set dir=~\bkp\\

"" Code-folding
" Set code-folding somewhat appropriately
set foldmethod=indent
" turn off automatic code-folding when opening a file
set foldenable
" use X columns on left to show fold info
set foldcolumn=5

" For complex commands, show what state you are in the command
" e.g. if typing '2dw' (delete two words), until the 'w' is pressed
" all other parts are shown in the bottom line
set showcmd
set omnifunc=syntaxcomplete#Complete

" find all code
set path=.,,,c:/code/**,shared

" show 3 lines of code around cursor (top or bottom), when possible
set scrolloff=3

" setup Vundle
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle/')

" let Vundle manage Vundle (required) and add all plugins
Plugin 'VundleVim/vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'rip-rip/clang_complete'
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'a.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'aklt/plantuml-syntax'
Plugin 'abudden/taghighlight-automirror'
Plugin 'ap/vim-css-color'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'
Plugin 'davidhalter/jedi-vim'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'CCtree'

call vundle#end()

"" Turn filetype on for Vundle to work
filetype plugin indent on

"" Set mapleader to , instead of \ for ease
let mapleader = ","

" for CtrlP plugin;
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

set runtimepath^=~/vimfiles/bundle/ctrlp.vim

" Change default CtrlP function to mixed (search paths, buffers,
" and MostRecentlyUsed
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_lazy_update = 350
" let g:ctrlp_clear_cache_on_exit = 0

let g:ctrlp_max_files = 0

" if executable("ag")
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag -i --nocolor --nogroup --hidden -g %s'
" endif


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
nnoremap <S-F5> :silent make<CR>
nnoremap <F4> :SyntasticCheck<CR>
" random keybindings for ease
" bring next match to middle of screen from either direction
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" remap ZQ to close a current buffer
nnoremap ZQ :bd<CR>
nnoremap <F10> :SyntasticToggleMode<CR>
nnoremap <F12> :silent Ack!<CR>
" remove trailing whitespace in entire file with F4
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"" Leader Mappings
" lets <,><space> get rid of search highlights
nnoremap <silent> <leader><space> :noh<cr>
" <,><x> map to remove all extra windows
nnoremap <silent> <leader>x :ccl<cr> :lcl<cr> :pc<cr>

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

"" Setup Airline extension
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
" Enable buffer-line from Airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#left_sep = '⮀'
" let g:airline#extensions#tabline#left_alt_sep = '⮁'
set laststatus=2
" Add linecount to Airline
call airline#parts#define_raw('lineno', '%L ')
call airline#parts#define_raw('columnno', ':%3v')
call airline#parts#define_accent('columnno', 'italic')
function! AirlineAddLinecount()
  let g:airline_section_z = airline#section#create(['windowswap', 'linenr', '/', 'lineno', 'columnno'])
  AirlineRefresh
endfunction
autocmd VimEnter * call AirlineAddLinecount()
autocmd BufEnter * highlight Comment gui=italic cterm=italic term=italic

" Enable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let b:syntastic_mode = "passive"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = 'passive'
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { "level": "warning" }

"" Ctags options
" look recursively for tags file
set tags=tags;
" settings for clang_complete
let g:clang_close_preview = 1
let g:clang_library_path = "C:\\Program Files\\LLVM\\bin"
let g:clang_user_options = "|| exit 0"
" make completion go faster by eliminating include files
set complete-=i

" workaround for autopairs+clang_complete
" let g:AutoPairsMapCR = 0
" imap <silent><CR> <CR><Plug>AutoPairsReturn
" settings for auto-pairs
" let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 1


" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab-like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
map <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" settings for SuperTab
" let g:SuperTabDefaultCompletionType = "context"

" settings for Xolox vim-shell
let g:shell_fullscreen_items = 'm'
call xolox#shell#maximize()

" settings for PlantUML
let g:plantuml_executable_script = 'java -jar c:\users\irgpqt\plantuml.jar'

" settings for Rainbow parens
let g:rainbow_active = 1

" settings for jedi-vim (python)
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0

" If 'Ag' is installed, then let it run instead of Ack
if executable('ag')
  let g:ackprg = 'ag --ignore "Debug Build" --vimgrep'
endif

highlight Comment gui=italic cterm=italic term=italic
colorscheme afterglow

" open in full screen
au GUIEnter * simalt ~x
