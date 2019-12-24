" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0

" Use ale instead
let g:intero_use_neomake = 0

au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>
au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
