filetype plugin indent on

set number
set ruler
set ts=4
set sw=4
set autoindent
set cindent
set smartindent
set visualbell
set hlsearch

autocmd FileType make setlocal noexpandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

syntax on
colorschem desert

nnoremap <C-h> :noh<CR>
