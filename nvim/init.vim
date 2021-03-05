call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" TS
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }
" GQL Syntax highlighting
Plug 'jparise/vim-graphql'
" Terraform highlighting
Plug 'hashivim/vim-terraform'
call plug#end()

set number
set relativenumber
set noswapfile

" Mappings
imap jk <Esc>

set ttimeoutlen=10

let mapleader=","

nnoremap <leader>p :tabe %:p:h<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buff<CR>

" Coc.vim (LSP-related) config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" LSP stuff
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> g{ <Plug>(coc-diagnostic-prev-error)
nmap <silent> g} <Plug>(coc-diagnostic-next-error)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" End Coc example config

syntax enable
colorscheme PaperColor
set background=dark
filetype plugin indent on

set rtp+=~/.fzf
