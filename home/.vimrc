:syntax on
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set autochdir
:autocmd FileType xml,html,xhtml set tabstop=2|set shiftwidth=2
:autocmd FileType tex,txt set spell
:set smartindent
:color desert
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%80v.\+/