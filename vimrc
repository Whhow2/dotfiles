""" prevent ALE from doing code completion
let g:ale_disable_lsp = 1

""" PLUGINS """
call plug#begin()
Plug 'Luxed/ayu-vim'
Plug 'vim-airline/vim-airline'
" Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rhysd/vim-lsp-ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
call plug#end()

""" CORE SETTINGS """
"turn on syntax highlighting
syntax on
set re=0

""" COLORSCHEME """
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
let g:ayucolor="mirage"
colorscheme ayu

""" TRANSPARENCY
" hi Normal guibg=NONE ctermbg=NONE

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
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
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
if (!has("nvim"))
    set undodir=~/.vim/.undo
endif

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

""" KEYMAPS """
"leader key set to space
nnoremap <SPACE> <Nop>
let mapleader=" "

""" saving
nnoremap zz :update<CR>
inoremap <C-z> <ESC>:update<cr>a

""" clear highlighting
nnoremap <silent><Leader>h :noh<CR>

""" mac alt keys
imap ˙ <Left>
" imap ∆ <Down>
" imap ˚ <Up>
imap ¬ <Right>

""" easy escape
inoremap jk <ESC>:update<CR>
inoremap kj <ESC>


" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" navigate buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" moving text vertically
""" for mac
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""" terminal drawer
nnoremap <Leader>t :ToggleTerminalDrawer<CR>
inoremap <A-t> :ToggleTerminalDrawer<CR>
inoremap † :ToggleTerminalDrawer<CR>

""" ALE  """
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'python': ['isort', 'black']
      \}

let g:ale_linters = {
 \ 'javascript': ['eslint'],
 \ 'ps1': ['psscriptanalyzer'],
 \ }

let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'

""" COC """
" Servers
" let g:coc_global_extensions = ['coc-html', 'coc-tsserver', 'coc-json', 'coc-css', 'coc-jedi', 'coc-powershell']

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" " inoremap <silent><expr> <TAB>
" "       \ pumvisible() ? "\<C-n>" :
" "       \ <SID>check_back_space() ? "\<TAB>" :
" "       \ coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" " inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" " GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Symbol renaming
" nmap <leader>rn <Plug>(coc-rename)

" " Mappings for CoCList
" " Show all diagnostics
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

""" TERMINAL """
""" FLOATERM """
nnoremap <C-/> :FloatermToggle!<CR>
tnoremap <C-/> <C-\><C-n>:FloatermToggle<CR>

""" FILES AND SEARCHING """

""" NERDTREE """
nnoremap <leader>n :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"searching
nnoremap <silent><Leader><Space> :Files<Cr>
nnoremap <silent><Leader>fg :GFiles<Cr>
nnoremap <silent><Leader>ft :Rg<Cr>
nnoremap <silent><Leader>fb :Buffers<Cr>
nnoremap <silent><Leader>fh :History<Cr>

""" VIM-LSP """
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction


""" ASYNCCOMPLETE """
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
