" vimrc file for Hyunchel Kim <hyunchel.inbox@gmail.com>

" As VIM manual suggest...
source $VIMRUNTIME/defaults.vim

if &t_Co > 2
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


let mapleader = ' '
let maplocalleader = '\\'

" colors
set background=dark
syntax enable
colorscheme seoul256

" the tabs
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

" misc
set number
set relativenumber
set colorcolumn=100
set tags=./tags,tags;

" vim-go options
let g:go_template_autocreate = 0

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" abbreviations
iabbrev pdb; import pdb;pdb.set_trace()
iabbrev #!! #! /usr/bin/env bash
iabbrev @@ hyunchel.inbox@gmail.com

" languages
augroup filetype_python
    autocmd!
    autocmd Filetype python setlocal tabstop=4 shiftwidth=4
    autocmd Filetype python nnoremap <buffer> <localleader>c I# <esc>j
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType python :iabbrev <buffer> ifname if __name__ == '__main__':
augroup END

augroup filetype_javascript
    autocmd!
    autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_html
    autocmd!
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufReadPost *.html,*.js :normal gg=G
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup filetype_txt
    autocmd!
    autocmd BufNewFile,BufReadPost *.txt setlocal spell
augroup END

augroup filetype_md
    autocmd!
    " "inside/around heading"
    " autocmd FileType md onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\|--\\)\\+$\r:nohlsearch\rkvg_"<cr>
    " autocmd FileType md onoremap <buffer> ah :<c-u>execute "normal! ?^(==|--)\\+$\r:nohlsearch\rg_vk0"<cr>
    " Statusline
    " autocmd FileType md setlocal statusline=%l
augroup END

" Statuslines
"set statusline=%4l,%-4c " Row and Colum
"set statusline+=\ %P " Percentage
"set statusline+=\ %m%r%h " Flags(modified, readonly, help)
"set statusline+=%= " Switch to right side
"set statusline+=%f\  " Relative path to the file

" Just VIM Plug.
call plug#begin('~/.vim/plugged')

" Language
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-jdaddy' "Json text objects
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Short cuts
nnoremap <space> <nop>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap ., :TagbarToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>r :History/<CR>

vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>

inoremap jk <esc>
inoremap <esc> <nop>

" "parameter"
onoremap p i(

" "inside next/last parentheses"
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" "around next/last parentheses"
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" "inside next/last brackets"
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

" "around next/last brackets"
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>


" Overwrites existing ones. Not sure if I would keep them
nnoremap H 0
nnoremap L $

" GoPls
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
