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
inoremap jk <ESC>

"searching
nnoremap <silent><Leader><Space> :Files<Cr>
nnoremap <silent><Leader>fg :GFiles<Cr>
nnoremap <silent><Leader>ft :Rg<Cr>
nnoremap <silent><Leader>fb :Buffers<Cr>
nnoremap <silent><Leader>fh :History<Cr>

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
