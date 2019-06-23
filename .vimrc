call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe',
"colorschemes
Plug 'morhetz/gruvbox'
call plug#end()


colorscheme gruvbox
set background=dark

set number
set expandtab
set tabstop=2

set hlsearch
set incsearch
set smartindent

syntax on

"mappings

map <C-n> :NERDTreeToggle<CR>
