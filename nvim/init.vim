call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
call plug#end()

set number
set relativenumber
set noswapfile

" Mappings
imap jk <Esc>

let mapleader=","

nnoremap <leader>p :tabe %:p:h<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buff<CR>

" Get out of terminal mode more easily
" Useful with Intero etc
tnoremap <Esc> <C-\><C-n>
" End Mappings

syntax enable
colorscheme PaperColor
set background=dark

set rtp+=~/.fzf
