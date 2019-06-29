call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
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
set modifiable

syntax on
let g:mapleader=','

"mappings

map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
