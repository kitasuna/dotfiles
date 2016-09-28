set nocompatible              " be iMproved, required
set number
filetype off                  " required


let mapleader=","
nnoremap <leader>t :tabe %:p:h<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-unimpaired'

Plugin 'godlygeek/csapprox'

" Plugin 'bpearson/vim-phpcs'

Plugin 'scrooloose/nerdtree'

Plugin 'mhinz/vim-startify'

Plugin 'tpope/vim-surround.git'

Plugin 'pangloss/vim-javascript'

Plugin 'cohama/lexima.vim'

Plugin 'NLKNguyen/papercolor-theme'
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

"let Vimphpcs_Standard='/home/eric/www/bandwidth-cms/phpcs.xml'
let g:syntastic_php_phpcs_args='--standard=$HOME/www/bandwidth-cms/phpcs.xml'

"
" Syntastic, newb settings
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['phpcs']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['php', 'javascript'], 'passive_filetypes': [] }
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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
