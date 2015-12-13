syntax on
colorscheme badwolf
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set number
set softtabstop=4


" Remove trailing white spaces - Thanks to Travis
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
