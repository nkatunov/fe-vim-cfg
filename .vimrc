" Specify a directory for plugins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" NerdTree - file panel with Ctrl N
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Add enclosing brackets when type
Plug 'jiangmiao/auto-pairs'
" Git wrapper :G during edit
Plug 'tpope/vim-fugitive'
" Display git changes on the left where line numbers are
Plug 'airblade/vim-gitgutter'
" File search & navigation with Ctrl P
Plug 'kien/ctrlp.vim'
" Extra features for search & fast navigation
Plug 'easymotion/vim-easymotion'
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Code formatter, works on autosave
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Icons for nerdtree. User Fira code NF to work.
Plug 'ryanoasis/vim-devicons'
" Typescript syntax support
Plug 'HerringtonDarkholme/yats.vim'
" colorschemes
Plug 'morhetz/gruvbox'
call plug#end()


colorscheme gruvbox
set background=dark
set noswapfile
set number
" always uses spaces instead of tab characters
set expandtab
set tabstop=2
set encoding=UTF-8
set hlsearch
set incsearch
set smartindent
set modifiable
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


syntax on
let g:mapleader=','

"mappings
" Exit mode with jk
inoremap jk <ESC>
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

" Plugin settins
" run prettier on save
let g:prettier#autoformat = 1
" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
