""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INIT VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Github plugin
Plugin 'tpope/vim-fugitive'

" status bar plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" File manager
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Color Scheme
Plugin 'morhetz/gruvbox'

" Syntax 
Plugin 'sheerun/vim-polyglot'

" Additional custom plugins (optional)
source ~/vim/vimrcs/additional_plugins.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2                                        " Make airline appear by default
set noshowmode                                          " disable the default mode indicator i.e. -- INSERT --
let g:airline_theme='term'                              " set theme that does not require powerline fonts
let g:airline_detect_modified=0                         " If on colors change if there are unwritten changes
let g:airline#extensions#tabline#show_buffers = 0       " Corrects tab line for closed but not deleted buffers
let g:airline#extensions#tabline#fnamemod = ':t'        " Dont show path in tab name, just file name
let g:airline#extensions#tabline#enabled = 1            " turn on airline tabs
let g:airline#extensions#tabline#left_sep = '|'         " characters seperating selected tab
let g:airline#extensions#tabline#left_alt_sep = '-'     " characters seperating the non-selected tabs

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUGITIVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt+=vertical

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if no file is opened, then open NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" map crtl-n to open/close NERDTree in all tabs (NERDTree-tabs)
map <C-n> :NERDTreeTabsToggle<CR>

" closes buffer if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set the expand/collapse arrows 
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

" Change the default colors
highlight Directory ctermfg=blue
highlight NERDTreeOpenable ctermfg=green
highlight NERDTreeClosable ctermfg=lightred

" ignore irrelevant files
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GruvBox
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/morhetz/gruvbox/wiki/Configuration
" Set GruvBox as color scheme (dark mode)
set background=dark " Setting dark mode

let g:gruvbox_termcolors = '256'
let g:gruvbox_invert_tabline = '0'
let g:gruvbox_contrast_dark = 'hard' "soft, medium, hard
let g:gruvbox_contrast_light = 'medium' "soft, medium, hard
" Colors valid values are from gruvbox palette
let g:gruvbox_hls_cursor = 'orange'
let g:gruvbox_number_column = 'bg0'

colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Polygot
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/sheerun/vim-polyglot
" disable syntax for the following files:
let g:polyglot_disabled = []

" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
