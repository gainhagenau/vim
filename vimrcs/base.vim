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
" jj is much faster than esc 
imap jj <esc>"            jj goes to normal mode from insert mode
" Note that remapping C-s requires flow control to be disabled
" (add 'stty ixany' & 'stty ixoff -ixon' to .bashrc)
map <C-s> <esc>:w<cr>                " Ctrl + s --> saves file
imap <C-s> <esc>:w<cr>               " Ctrl + s --> saves file
map <C-d> <esc>:q<cr>                " Ctrl + d --> exits
imap <C-d> <esc>:q<cr>               " Ctrl + d --> exits
map <leader><C-d> <esc>:q!<cr>       " , + Ctrl + d --> force exit

" Pressing ,ss will toggle and untoggle spell checking
map <leader>s :setlocal spell!<cr>
 
" ,p will replace the current word with what is in the default register
noremap <leader>p "_dawhp

" Search for current word shortcut (sacrifices jumping to letter f in line)
" lb puts cursor at the start of the word so ye selects only the word
noremap ff lb"aye/<C-r>a<cr>N
" Search and replace current word shortcut (sacrifices jumping to letter r in line)
noremap fr lb"aye:%s/<C-r>a/

" Delete line but to not copy.
noremap DD "_dd

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
" WINDOWS
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
" Toggle paste mode
set pastetoggle=<F1>

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



         
