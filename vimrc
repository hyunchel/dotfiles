syntax on
colorscheme badwolf
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set colorcolumn=100
set backspace=indent,eol,start


" Custom
:ia pdb import pdb;pdb.set_trace()


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

" Quicker NORMAL mode.
inoremap jj <ESC>

" Open JS files with different tab spaces.
au FileType javascript set ts=2 sw=2 sts=2


" VIMPLUG!
call plug#begin()
" Plug 'Valloric/YouCompleteMe'
call plug#end()

" status line
set laststatus=2
set statusline+=%t
set statusline+=[%{strlen(&fenc)?&fenc:'none'},
set statusline+=%{&ff}]
set statusline+=%y
set statusline+=\ %c,
set statusline+=%l/%L
set statusline+=\ %P
