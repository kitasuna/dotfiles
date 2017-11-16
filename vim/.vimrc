set nocompatible              " be iMproved, required
" Line number fun
set number
set relativenumber
set noswapfile
set colorcolumn=78

set autochdir
set tags=tags;

filetype off                  " required

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let mapleader=","
nnoremap <leader>t :tabe %:p:h<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Nicer window splitting
nnoremap <C-w>\ <C-w>v
nnoremap <C-w>= <C-w>s

" Remap esc
imap jk <Esc>

" Move swap files
set directory=$HOME/.vim/swapfiles//

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Hide image files from dir listings
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png

Plugin 'gmarik/Vundle.vim'

" Git stuff
Plugin 'tpope/vim-fugitive'

" Linter etc
Plugin 'scrooloose/syntastic'

" Inserting of blank lines from normal mode etc
Plugin 'tpope/vim-unimpaired'

" Async compiler etc execution
Plugin 'tpope/vim-dispatch'

" Wrapping words in quotes, tags, etc
Plugin 'tpope/vim-surround.git'

" File tray
Plugin 'scrooloose/nerdtree'

" Auto closing of quotes and parents
Plugin 'cohama/lexima.vim'

Plugin 'NLKNguyen/papercolor-theme'

" Interact with tmux from within vim
Plugin 'benmills/vimux'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Intellisense or whatever. Autocomplete-y stuff
Plugin 'Valloric/YouCompleteMe'

" Typescript syntax highlighting and indentation
Plugin 'leafgarland/typescript-vim'

" Plugin 'pangloss/vim-javascript'

" Plugin 'mhinz/vim-startify'

" Plugin 'godlygeek/csapprox'

" Plugin 'bpearson/vim-phpcs'
"
" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set guifont=Monospace\ 12


"
" Syntastic, newb settings
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_typescript_tslint_args = "./*"
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config /home/eric/.eslintrc"
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" IMPORTANT: Uncomment one of the following lines to force
" " using 256 colors (or 88 colors) if your terminal supports it,
" " but does not automatically use 256 colors by default.
set t_Co=256
" "set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set background=light
colorscheme PaperColor
" colorscheme pyte
" colorscheme solarized
syntax enable

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

" Force typescript filetype for ts extension
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Saved macros
let @c = "yyp^f(lysiw'li^^^ jk"
