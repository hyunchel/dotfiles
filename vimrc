" vimrc file for Hyunchel Kim {{{

source $VIMRUNTIME/defaults.vim

let mapleader = ' '
let maplocalleader = '\\'

" }}}

" Basic settings {{{
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
set hlsearch incsearch
set number
set relativenumber
set colorcolumn=100
set tags=./tags,tags;
" }}}

" Abbreviations {{{
iabbrev pdb; import pdb;pdb.set_trace()
iabbrev #!! #! /usr/bin/env bash
" }}}

" File settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

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
    autocmd Filetype javascript inoremap {<space> {<space><space>}<ESC>hi
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_html
    autocmd!
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
    autocmd Filetype html inoremap <buffer> ><cr> ><esc>bf>%wywo</<esc>pi><esc>O
augroup END

augroup filetype_css
    autocmd!
    autocmd Filetype css setlocal tabstop=2 shiftwidth=2
    autocmd Filetype css inoremap <buffer> : :;<esc>i<space>
augroup END

augroup filetype_vue
    autocmd!
    autocmd Filetype vue setlocal tabstop=2 shiftwidth=2
    autocmd Filetype vue :iabbrev <buffer> vueinit
          \ <template><cr></template><cr><cr><script><cr>
          \export default {}<cr>
          \</script><cr><cr><style><cr></style>
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
" }}}

" Statuslines {{{
"set statusline=%4l,%-4c " Row and Colum
"set statusline+=\ %P " Percentage
"set statusline+=\ %m%r%h " Flags(modified, readonly, help)
"set statusline+=%= " Switch to right side
"set statusline+=%f\  " Relative path to the file
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
  let g:tagbar_sort = 0

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,javascript,javascript.jsx,vue EmmetInstall
  let g:user_emmet_settings = { 'javascript': { 'extends': 'jsx' } } 

Plug 'posva/vim-vue'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

call plug#end()
" }}}

" Mappings {{{
nnoremap <space> <nop>
nnoremap / /\v

" Insert a new line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Save file
nnoremap <leader>s :update<cr>

" Quit file
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

" Reopen last file
nnoremap <leader><space> :execute "leftabove vsplit " . bufname("#")<CR>
" Match trailing space
nnoremap <leader>w :match Error /\v\s+\n/ <cr>
nnoremap <leader>W :match<cr>
" Clear highlight
nnoremap <leader>c :nohlsearch<cr>
" Easy access to VIMRC file
nnoremap <leader>er :vsplit $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>
" Browse quick-fix items
nnoremap <leader>k :cprevious<cr>
nnoremap <leader>j :cnext<cr>

" Plugins
nnoremap ., :TagbarToggle<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>r :History/<CR>

" window splits + fzf
nnoremap <leader>st :tab sp<cr>:GFiles<cr>
nnoremap <leader>ss :split<cr>:GFiles<cr>
nnoremap <leader>sv :vsplit<cr>:GFiles<cr>
nnoremap <leader>F :Rg<cr>

" Toggle paste
nnoremap <leader>v :set paste!<CR>

" futigive
nnoremap <leader>g :Git<CR>

" Go stuffs
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gr :GoRun<CR>
nnoremap <leader>gi :GoInfo<CR>
nnoremap <leader>gt :GoTest<CR>
nnoremap <leader>gtf :GoTestFunc<CR>
nnoremap <leader>gpt :GoPointsTo<CR>
nnoremap <leader>gk :GoKeyify<CR>
nnoremap <leader>gfs :GoFillStruct<CR>
nnoremap <leader>gie :GoIfErr<CR>k%w

" Quote selected words
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>

" Search selected words
vnoremap <leader>/ y/<C-R>"<CR>

" Easy escape
inoremap jk <esc>
inoremap <esc> <nop>

" Auto-closings
" inoremap {<CR> {<CR>}<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O

" "inside next/last parentheses"
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

" "around next/last parentheses"
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" "inside next/last curly brackets"
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

" "around next/last curly brackets"
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" "inside next/last brackets"
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>

" "around next/last brackets"
onoremap an[ :<c-u>normal! f[va[<cr>
onoremap al[ :<c-u>normal! F]va[<cr>

" "inside next/last quotes"
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

" "around next/last quotes"
onoremap an' :<c-u>normal! f'va'<cr>
onoremap al' :<c-u>normal! F'va'<cr>

" "inside next/last double quotes"
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>

" "around next/last double quotes"
onoremap an" :<c-u>normal! f"va"<cr>
onoremap al" :<c-u>normal! F"va"<cr>

" }}}

" Golang settings {{{
" vim-go options
let g:go_template_autocreate = 0

" GoPls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" }}}

" Miscellaneous {{{
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
" }}}
