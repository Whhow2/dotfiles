"turn on syntax highlighting
syntax on

"file format settings
set fileformat=unix
set encoding=UTF-8

"whitespace and tab settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab
set backspace=indent,eol,start

"line wrapping
set nowrap

"cursor and number settings
set cursorline
set number
set relativenumber
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes

"error sounds and flashes
set noerrorbells visualbell t_vb=

"status settings
set showcmd
set noshowmode
set conceallevel=1

"backup files
set noswapfile
set nobackup
set undofile

"clipboard setting
set clipboard=unnamed

"searching
set ignorecase
set smartcase
set incsearch
set hlsearch

"mouse setting
set mouse=a

" splits
set splitbelow
set splitright
