" ================================
" Welcome to yossarian42 vimrc file
" ================================

set nocompatible              " be iMproved, required

" --------------------------------
"  Plugins
" --------------------------------
" pathogen runtime injection
execute pathogen#infect()

" filtetype detection, indent scripts and filetype plugins on
filetype plugin indent on
filetype plugin on
" syntax highlighting 
syntax on             


" --------------------------------
"  Pretty things
" --------------------------------
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='soft'

" Set Airline bar theme
let g:airline_theme='luna'

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active=1    " 0 if you want to enable it later via :RainbowToggle

" Colour at column 80
set colorcolumn=80

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

set scrolloff=3     " Start scroling when 8 lines away from margins

" paste from system clipboard, align indentation with surroundings
noremap <Leader>p "*]p:set nopaste<CR>
" copy a sentence into system clipboard
noremap <Leader>y "+y) 
     
" map <ESC> to jj
inoremap jj <ESC>

" Pasting - indent last pasted
nnoremap gz '[='] 

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><ESC> :noh<cr>

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
let &t_SR = "\e[3 q"
let &t_EI = "\e[2 q"

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

" enable syntax highlighting
syntax enable

" show the matching part of the pair for [] {} and ()
set showmatch


" -------------------------------- 
"  ctrlp configuration 
" -------------------------------- 
set runtimepath^=~/.vim/bundle/ctrlp.vim


" -------------------------------- 
"  Tagbar configuration 
" -------------------------------- 
nmap <F8> :TagbarToggle<CR>


" -------------------------------- 
"  pydiction configuration 
" -------------------------------- 
let g:pydiction_location = '/home/yossarian42/.vim/bundle/pydiction/complete-dict'


" -------------------------------- 
"  MRU configuration 
" -------------------------------- 
" store list of recently edited file names
let MRU_File = '/home/yossarian42/.vim_mru_files'
" max old file names
let MRU_Max_Entries = 100
" exclude file names, not the files in /tmp or /var/tmp
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" auto close
let MRU_Auto_Close = 1
" max file names present
let MRU_Max_Menu_Entries = 10
" open a file in a new tab
let MRU_Open_File_Use_Tabs = 1


" -------------------------------- 
"  New Command
" -------------------------------- 
" ':Shell' opens a scratch buffer for the ouput of shell command
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
	let expanded_part = fnameescape(expand(part))
	let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


" --------------------------------
"  Python Configuration 
" --------------------------------
" enable all python syntax highlighting features
let python_highlight_all = 1

" enable syntastic checking plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3.6'
let g:syntastic_python_checkers = ['pep8']
" disable automatic syntax checking for python files
"let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" jedi autocompletion setup
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buggers  = 1
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = "<Tab>"


" --------------------------------
"  Markdown Configuration 
" --------------------------------
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 1
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which livedown server will run
let g:livedown_port = 1337
" the browser to use
let g:livedown_browser = 'firefox'

