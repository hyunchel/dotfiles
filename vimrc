syntax on
colorscheme badwolf
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
set number
set colorcolumn=100


" Custom abbreviations 
ia pdb import pdb;pdb.set_trace()

" Quicker NORMAL mode.
inoremap jj <ESC>


" Remove trailing white spaces - Thanks to Travis
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" Remove blank lines.
func! DeleteBlankLine()
    exe "normal mz"
    g/^$/d
    exe "normal `z"
endfunc
"autocmd BufWrite *.py :call DeleteBlankLine()


" Different syntax for C programming.
" autocmd BufNewFile,BufRead *.[c,h] set colorscheme=seoul256
" au FileType c colo seoul256
au FileType c colo gotham256

" Open JS files with different tab spaces.
au FileType javascript set ts=2 sw=2 sts=2
