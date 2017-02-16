""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is a base vimrc that will work out of the box     "
" with no plugins.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on " Filetype auto-detection
filetype indent on 
syntax on " Syntax highlighting


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number            " turns on line numbers
set relativenumber    " All line numbers but the current line will be relative
set cmdheight=2       " Height of the command bar becomes 2 lines

set background=dark   " set background
" To see all installed colorschemes: <leader>colorscheme (space) (tab)
colorscheme default     " default color scheme
" default comments are too dark and hard to read
highlight Comment ctermfg=blue

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation / tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4         " 1 tab --> 4 spaces
set shiftwidth=4      " sets spaces used by (<< & >>)
set expandtab         " use spaces instead of tabs.
set smarttab          " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround        " tab / shifting moves to closest tabstop.
set autoindent        " Match indents on new lines.
set smartindent       " Intellegently dedent / indent new lines based on rules.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching related configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase        " case insensitive search
set smartcase         " If there are uppercase letters, become case-sensitive.
set incsearch         " live incremental searching
set showmatch         " live match highlighting
set hlsearch          " highlight matches
set gdefault          " use the `g` flag by default. Making operations apply globably 
" <Space> --> / (search) 
map <space> / 
" <Ctrl><Space> --> ? (search backwards) 
map <c-space> ? 
" <tab> --> removes highlighting
map <tab> :noh<cr>


" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makes changes persistant once the file has been closed
" NOTE: this dir must exist for it to work
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode 
" map <leader>pp<cr> :set paste!<cr>
set pastetoggle=<F1>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

