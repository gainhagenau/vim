" Author: Gain Hagenau
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USER INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on    " File type auto-detection
filetype indent on    " File type specific indentation enabled
syntax on             " Syntax highlighting

set number            " turns on line numbers
set relativenumber    " All line numbers but the current line will be relative
set cmdheight=2       " Height of the command bar becomes 2 lines

set nowrap

set background=dark   " set background
" To see all installed colorschemes => :colorscheme (space) (tab)
colorscheme default   " use default color scheme
" default comments are too dark and hard to read
highlight Comment ctermfg=blue
highlight Normal ctermfg=White
" Line number coloring
highlight CursorLineNr   term=bold ctermfg=Green gui=bold guifg=Green
highlight  LineNr   term=bold ctermfg=Grey gui=bold guifg=Grey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL KEY REMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
" jj escapes to normal mode and is much faster than esc 
imap jj <esc>
" Note that remapping C-s requires flow control to be disabled
" (add 'stty ixany' & 'stty ixoff -ixon' to .bashrc)
" Ctrl + s --> saves file
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>
" Ctrl + d --> exits
map <C-d> <esc>:q<cr>
imap <C-d> <esc>:q<cr>
" , + Ctrl + d --> force exit
map <leader><C-d> <esc>:q!<cr>

" Toggle paste mode when in insert mode using F1
set pastetoggle=<F1>
" Toggle line numbers on and off in normal mode using F2
nnoremap <F2> :set number! relativenumber!<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>s :setlocal spell!<cr>
 
" ,p will replace the current word with what is in the default register
noremap <leader>p "_dawhp

" Search for current word shortcut (sacrifices jumping to letter f in line)
" lb puts cursor at the start of the word so ye selects only the word
noremap ff lb"aye/<C-r>a<cr>N
" Search and replace current word shortcut (sacrifices jumping to letter r in line)
noremap fr lb"aye:%s/<C-r>a/

" Search for highlighted text from visual mode
vnoremap ff "ay/<C-r>a<cr>N

" Delete line but to not copy.
noremap DD "_dd

" Map page up/down to K/J respectively and place cursor in the middle 
" This results in the loss of:
"       - K: look of man file for the word the cursor is currently on
"       - J: Append the line bellow to the end of the current line
noremap K <C-b>M
noremap J <C-f>M

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION / TABS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4         " 1 tab --> 4 spaces
set shiftwidth=4      " sets spaces used by indent (< & >)
set expandtab         " use spaces instead of tabs.
set smarttab          " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround        " tab / shifting moves to closest tabstop.
set autoindent        " Match indents on new lines.
set smartindent       " Intelligently dedent / indent new lines based on rules.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase        " case insensitive search
set smartcase         " If there are uppercase letters, become case-sensitive.
set incsearch         " live incremental searching
set showmatch         " live match highlighting
set hlsearch          " highlight matches
set gdefault          " use the 'g' flag by default. Making operations apply globally

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" double slash --> no highlight
map // :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDOWS / TAB PAGES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Short cut for creating windows
" v - vertical, h - horizontal
map <leader>v <C-w>v
map <leader>h <C-w>s

" more standard controls for moving between tabs
map <Tab> :tabn<cr>
map <S-Tab> :tabp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILES / UNDO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makes changes persistent once the file has been closed
" NOTE: this dir must exist for it to work
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" Turn backup off, swap files are annoying
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Make backspace work correctly
set backspace=indent,eol,start

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" Uncomment to have it clean on save for given file types
" autocmd BufWrite *.py :call DeleteTrailingWS()
" autocmd BufWrite *.yml :call DeleteTrailingWS()

" :Help will open help vertically (default :help opens horizontal split)
command -nargs=* -complete=help Help vertical belowright help <args>
