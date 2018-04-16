au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80

autocmd BufWritePre *.py %s/\s\+$//e

set nu
set listchars=tab:▸\ ,trail:·
set list
set mouse=a
