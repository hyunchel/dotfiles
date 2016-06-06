syntax on
colorscheme badwolf
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set softtabstop=4


" Remove trailing white spaces - Thanks to Travis
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()


" Custom abbreviations 
ia pdb import pdb;pdb.set_trace()

" Different syntax for C programming.
" autocmd BufNewFile,BufRead *.[c,h] set colorscheme=seoul256
" au FileType c colo seoul256
au FileType c colo gotham256
