set expandtab
set shiftwidth=2
set tabstop=2

let b:ale_fixers = ['prettier']

nnoremap <leader>ti :TsuImport<CR>
nnoremap <leader>tr :TsuReferences<CR>
nnoremap <leader>td :TsuTypeDefinition<CR>
autocmd FileType typescript nmap <buffer> <leader>tt : <C-u>echo tsuquyomi#hint()<CR>

