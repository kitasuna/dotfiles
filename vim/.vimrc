set nocompatible              " be iMproved, required
" Line number fun
set number
set relativenumber
set noswapfile
set colorcolumn=78

set tags=tags;

filetype off                  " required
syntax enable

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let mapleader=","
nnoremap <leader>t :tabe %:p:h<CR>
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

" Linter etc
Plug 'scrooloose/syntastic'

" Inserting of blank lines from normal mode etc
Plug 'tpope/vim-unimpaired'

" Async compiler etc execution
Plug 'tpope/vim-dispatch'

" Wrapping words in quotes, tags, etc
Plug 'tpope/vim-surround'

" File tray
Plug 'scrooloose/nerdtree'

" Auto closing of quotes and parents
Plug 'cohama/lexima.vim'

Plug 'NLKNguyen/papercolor-theme'

" Interact with tmux from within vim
Plug 'benmills/vimux'

" Intellisense or whatever. Autocomplete-y stuff
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Track the engine.
Plug 'SirVer/ultisnips'

" Purescript fancies
Plug 'purescript-contrib/purescript-vim'

" YAML folding (argh Swagger)
Plug 'digitalrounin/vim-yaml-folds', { 'for': 'yaml' }

" Syntax highlighting etc
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" TS Autocomplete
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

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
let g:syntastic_javascript_eslint_args = "--no-eslintrc --config /home/eric/.eslintrc"
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Typescript syntax plug has crap indentation rules
let g:typescript_indent_disable = 1

" Try to get TS tooltips working
" set ballooneval
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript nmap <buffer> <leader>i : <C-u>echo tsuquyomi#hint()<CR>

"
" Purescript config
let purescript_indent_if = 3
let purescript_indexnt_case = 5
let purescript_indent_let = 4
let purescript_indent_where = 6
let purescript_indent_do = 3
let purescript_indent_in = 1
let purescript_invent_dot = v:true

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
