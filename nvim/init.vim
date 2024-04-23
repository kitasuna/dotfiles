call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Rhubarb allows github integration with fugitive
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
" For managing LSPs, linters, etc
Plug 'williamboman/mason.nvim'
" Snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'preservim/vimux'
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }
" Rust
Plug 'simrat39/rust-tools.nvim'
" GQL Syntax highlighting
Plug 'jparise/vim-graphql'
" Terraform highlighting
Plug 'hashivim/vim-terraform'
" YAML folding for Swagger etc
Plug 'pedrohdz/vim-yaml-folds'
" Lots of highlighting
Plug 'sheerun/vim-polyglot'
" Copilot, hopefully
Plug 'github/copilot.vim'
" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Tell Neovim to use lua filetype detection (filetype.lua)
let g:do_filetype_lua = 1

" Tell neovim to ignore mouse
set mouse=

set number
set relativenumber
set noswapfile

" Mappings
imap jk <Esc>

set ttimeoutlen=10

let mapleader=","

nnoremap <leader>p :tabe %:p:h<CR>
" fzf shortcuts
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>b :Buff<CR>
" nnoremap <leader>g :GGrep<CR>
nnoremap <leader>rg :Rg 
" Copy all lines to system clipboard
nnoremap <leader>ya :%y+<CR>

" Fun with fugitive
" new branch
nnoremap <leader>gbn :G co -b
" list branches
nnoremap <leader>gbl :G branch<CR>
" vdiff
nnoremap <leader>gvd :Gvdiff<CR>

" Copy permalink to system clipboard
let @a="\"+:GBrowse!\<CR>"

" LSP-related config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" Vimux
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
map <leader>vp :VimuxPromptCommand<cr>
map <leader>vr :VimuxRunLastCommand<cr>
map <leader>vq :VimuxCloseRunner<cr>

syntax enable
colorscheme PaperColor
set background=dark
filetype plugin indent on

lua << EOF
require'lspconfig'.gopls.setup{}
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require'cmp'
cmp.setup({
		mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    snippet = {
      expand = function(args)
      require('luasnip').lsp_expand(args.body)
      end,
    },
	sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
})

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "+",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

-- Set up each LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspc = require('lspconfig')
lspc.gopls.setup {
  capabilities = capabilities
}
lspc.rust_analyzer.setup {
  capabilities = capabilities
}
EOF

" LSP config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ?d <cmd>lua vim.diagnostic.open_float()<CR>
" Kind of LSP config, close the quickfix window
nnoremap <silent> gh :cclose<CR>

set rtp+=~/.fzf
