set expandtab
set shiftwidth=2
set tabstop=2

set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd FileType typescript nmap <buffer> <Leader>y : <C-u>echo tsuquyomi#hint()<CR>
