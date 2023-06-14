set autoindent              " indent a new line the same amount as the line just typed
set autoread                " load external changes immediately
set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set encoding=utf-8
set expandtab               " converts tabs to white space
set fileformat=unix
set hlsearch                " highlight search 
set ignorecase              " case insensitive 
set incsearch               " incremental search
set laststatus=2            " always show status line
set nocompatible            " disable compatibility to old-time vi
set noerrorbells visualbell t_vb=
set number                  " add line numbers
set ruler
set shiftwidth=4            " width for autoindents
set showmatch               " show matching 
set smarttab
set splitbelow
set splitright
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set spell                   " enable spell check (may need to download language package)
set spelllang=en_us
set tabstop=4               " number of columns occupied by a tab 
set wildmenu
set wildmode=longest,list   " get bash-like tab completions
filetype plugin on
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting

" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" call plug#begin()

" call plug#end()
