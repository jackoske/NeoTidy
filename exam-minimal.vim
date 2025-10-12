" Minimal high-impact nvim config for exams
" Copy to ~/.vimrc or source in nvim

" Syntax highlighting
syntax on

" Line numbers
set number
set relativenumber

" Search highlighting
set hlsearch
set incsearch
set ignorecase
set smartcase

" Split navigation (Ctrl+h/j/k/l)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Easy split creation
nnoremap <C-w>- :split<CR>
nnoremap <C-w>\| :vsplit<CR>

" Mouse support
set mouse=a

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Color scheme (works without plugins)
colorscheme desert

" Show matching brackets
set showmatch

" Clipboard support
set clipboard=unnamedplus
