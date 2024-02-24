call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'AndrewRadev/tagalong.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
