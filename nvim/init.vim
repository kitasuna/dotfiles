call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
call plug#end()

set number
set relativenumber

" Mappings
imap jk <Esc>

let mapleader=","

nnoremap <leader>p :tabe %:p:h<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buff<CR>

" End Mappings

syntax enable
colorscheme PaperColor
set background=dark

set rtp+=~/.fzf
