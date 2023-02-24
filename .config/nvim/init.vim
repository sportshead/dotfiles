set runtimepath^=~/.vim runtimepath+=~/.vim/after 
let &packpath = &runtimepath 
source ~/.vimrc

call plug#begin()
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'lambdalisue/suda.vim'
call plug#end()

augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_enabled_javascript = ['prettierd', 'prettier', 'eslint-prettier', 'js-beautify']
let g:neoformat_enabled_typescript = ['prettierd', 'prettier', 'eslint-prettier']
let g:neoformat_enabled_css = ['prettierd', 'prettier', 'css-beautify']
let g:neoformat_enabled_html = ['prettierd', 'prettier', 'html-beautify']
