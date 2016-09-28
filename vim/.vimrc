set nocompatible              " be iMproved, required
" Line number fun
set number
set relativenumber
set noswapfile
set colorcolumn=78

set tags=tags;

filetype off                  " required
syntax on

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let mapleader=","
nnoremap <leader>p :tabe %:p:h<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buff<CR>

" Nicer window splitting
nnoremap <C-w>\ <C-w>v
nnoremap <C-w>= <C-w>s

" Remap esc
imap jk <Esc>

" enable fzf
set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
" Hide image files from dir listings
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png

" FZF commands
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git stuff
Plug 'tpope/vim-fugitive'

" Sweet sweet repeat
Plug 'tpope/vim-repeat'

" Inserting of blank lines from normal mode etc
Plug 'tpope/vim-unimpaired'

" Async compiler etc execution
Plug 'tpope/vim-dispatch'

" Wrapping words in quotes, tags, etc
Plug 'tpope/vim-surround'

" Several things, but used for snake <-> camel case conversion
Plug 'tpope/vim-abolish'

" File tray
Plug 'scrooloose/nerdtree'

Plug 'NLKNguyen/papercolor-theme'

" Interact with tmux from within vim
Plug 'benmills/vimux'

" Intellisense or whatever. Autocomplete-y stuff
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Purescript fancies
Plug 'purescript-contrib/purescript-vim'

" YAML folding (argh Swagger)
Plug 'digitalrounin/vim-yaml-folds', { 'for': 'yaml' }

" Syntax highlighting etc
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" TS Autocomplete
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'json'] }

Plug 'idris-hackers/idris-vim'

" Haskell stuff
Plug 'bitc/vim-hdevtools'

" Trying new linting engine thing
Plug 'w0rp/ale'

" All of your Plugins must be added before the following line
call plug#end()
filetype on

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set guifont=Monospace\ 12


filetype plugin indent on

" Enable hdevtools
let g:hdevtools_stack = 1

" IMPORTANT: Uncomment one of the following lines to force
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
" "set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set background=light
" set background=dark
colorscheme PaperColor
" colorscheme pyte
" colorscheme solarized

set viminfo='100,n$HOME/.vim/files/info/viminfo
set tags=tags;/

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! s:syncTree()
  if (&modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff)
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call s:syncTree()

" Force purescript filetype for ts extension
autocmd BufNewFile,BufRead *.purs setlocal filetype=purescript


" Saved macros
let @c = "yyp^f(lysiw'li^^^ jk"
