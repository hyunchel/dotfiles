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

" tab sizes
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2

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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap ., :TagbarToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>r :History/<CR>

" GoPls
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
