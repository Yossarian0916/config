" ================================
" Welcome to yossarian42 vimrc file
" ================================
set nocompatible              " be iMproved, required
" syntax highlighting 
syntax on             
" filtetype detection, indent scripts and filetype plugins on
filetype plugin indent on
filetype plugin on

" --------------------------------
"  Plugins
" --------------------------------
" vim-plug
call plug#begin('~/.vim/plugged')
" declare the list of plugins
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() } }
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'xavierd/clang_complete'
Plug 'tell-k/vim-autopep8'
Plug 'prettier/vim-prettier', {'do' : 'npm install'}
Plug 'mileszs/ack.vim'
"list ends here. plugins becom visible to vim after this call
call plug#end()

" --------------------------------
"  Basic stuff
" --------------------------------
let g:mapleader = "\<space>"    " Set leader to spacebar 
set spelllang=en_gb
set backspace=indent,eol,start " Bring backspace to life
" line number setup
set number          " Line numbers
set norelativenumber  " turn off relative line numbers
" soft wrap or hard wrap ?
set wrap            " wrap long lines to fit in the window
set linebreak       " prevent words from being split across two lines
set nolist
"set textwidth=80    " hard wrap, automatic word wrapping with 80 character limit
" search
set incsearch       " incremental search
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter

set autowrite       " Auto write befor running commands
set autoread        " Auto load files if they change on disc

set scrolloff=2     " Start scroling when 2 lines away from margins

" copy to system clipboard
vmap <C-c> "+y
" paste from system clipboard, align indentation with surroundings
noremap <Leader>p "*]p:set nopaste<CR>
" copy a sentence into system clipboard
noremap <Leader>y "+y) 
     
" map <ESC> to jj
inoremap jj <ESC>

" Cursor settings, mode settings explanation
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" SI = INSERT MODE
" SR = REPLACE MODE
" EI = NORMAL MODE
let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"
" highlight Cursor guifg=white guibg=black
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver25-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait100

" Open current file in a new vertical split with '='
" nnoremap = :vsplit<cr>

" Easy split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" resize window with +/-
if bufwinnr(1)
    nnoremap + <C-W>+
    nnoremap - <C-W>-
endif

" Simplify using tabs
"nnoremap ˙ gT
"nnoremap ¬ gt
nnoremap T :tabnew<cr>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
imap <C-Tab> :tabnext<CR>
imap <C-S-Tab> :tabprevious<CR>

" Open new splits to right and bottom 
set splitbelow
set splitright

" Tab completion
set wildmenu
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
    endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Tab size
set tabstop=8		" the width of a hard tapstop measured in spaces
set softtabstop=4	" works for mixed indentation
set shiftwidth=4	" the size of an indent measured in 4 spaces
set smarttab		" <Tab> at beginning line inserts spaces set in shiftwidth
set expandtab		" insert 4 spaces when pressing <Tab>, the same as softtabstop

" indentation
set smartindent		" indent at the start of a new line

" disable swap files
set noswapfile
				
" disable arrow keys in NORMAL mode
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" disable arrow keys in INSERT mode
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>

" show the matching part of the pair for [] {} and ()
set showmatch

" enable mouse in normal mode and visual mode
set mouse=nv

" --------------------------------
"  Pretty things
" --------------------------------
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'
highlight Normal ctermbg=None

" Set Airline bar theme
let g:airline_theme='luna'
"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active=1    " 0 if you want to enable it later via :RainbowToggle
" Colour at column 80
set colorcolumn=120
" airline customization
let g:airline_powerline_fonts=1
" enable/disable fugitive integration
let g:airline#extensions#fugitiveline#enabled=1
" enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" show filename
let g:airline#extensions#tabline#fnamemod=':t'

" set colors
" set t_Co=256

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


" -------------------------------- 
"  NerdTree configuration 
" -------------------------------- 
nnoremap <F5> :NERDTreeToggle<CR>

" -------------------------------- 
"  Tagbar configuration 
" -------------------------------- 
nmap <F8> :TagbarToggle<CR>

" -------------------------------- 
"  Ack configuration 
" -------------------------------- 
"  if silver-search ag is installed, use ag instead
if executable('ag')
    let g:ackprg = 'ag --smart-case --filename --column --nogroup --break --silent --vimgrep -Q'
endif
" default options ack
let g:ack_default_options = 
    \ " --recurse --nogroup --nopager --smart-case --color --with-filename --column -Q"

" --------------------------------
"  Syntastic Configuration
" --------------------------------
" enable syntastic checking plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" disable automatic syntax checking
let g:syntastic_mode_map = { 'passive_filetypes': ['py'] }

" --------------------------------
"  C/C++ Configuration
" --------------------------------
"  for clang_complete
let g:clang_library_path = '/usr/lib/llvm-10/lib/libclang-10.so.1'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_periodic_quickfix = 0
let g:clang_hl_errors = 1
let g:clang_close_preview = 1
let g:clang_jumpto_declaration_key = "<C-]>"
let g:clang_jumpto_declaration_in_preview_key = "<C-w>]"
let g:clang_jumpto_back_key = "<C-t>"

" --------------------------------
"  Python Configuration
" --------------------------------
" enable all python syntax highlighting features
let python_highlight_all = 0
" autopep8
let g:syntastic_pythyon_checkers=['autopep8', 'python3']
let g:autopep8_max_line_length = 79
let g:autopep8_on_save = 0
let g:autopep8_ignore = "W391"
let g:autopep8_aggressive = 1
let g:autopep8_indent_size = 4

" --------------------------------
"  JS Configuration
" --------------------------------
autocmd FileType javascript setlocal expandtab ts=2 sts=2 sw=2
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'

" --------------------------------
"  HTML/XML Configuration
" --------------------------------
autocmd FileType html setlocal expandtab smarttab ts=2 sts=2 sw=2
autocmd FileType xml setlocal expandtab smarttab ts=2 sts=2 sw=2

" --------------------------------
"  Markdown Configuration 
" --------------------------------
let g:markdown_fenced_languages = ['python', 'java', 'javascript', 'go']

" --------------------------------
"  AutoPairs Configuration 
" --------------------------------
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

