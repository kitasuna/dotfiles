set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab

au FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <leader>i <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <leader>c <F3> :HdevtoolsClear<CR>
