" File
set enc=utf-8
set fenc=utf-8
set noswapfile
set nobackup
set autoread
set hidden

" Visual
set number
set title
set cursorcolumn
set cursorline
set visualbell
set showmatch
syntax on
hi Comment ctermfg=2

" Status
set laststatus=2
set ruler
set showcmd
set wildmenu

" Indent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set list

" Search
set hlsearch
set incsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

" Move
nnoremap <C-j> }
nnoremap <C-k> {

" Others
set clipboard+=unnamed
set nrformats=
