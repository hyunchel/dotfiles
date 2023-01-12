" vimrc file for Hyunchel Kim {{{
let mapleader = ' '
let maplocalleader = '\\'

" }}}

" Basic settings {{{
" colors
set termguicolors
colorscheme NeoSolarized
set background=dark
syntax enable

" vimwiki
set nocompatible
filetype plugin on

" enable smart. ripgrep defaults to smartcase.
set ignorecase
set smartcase

" neosolarized
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum


" the tabs
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

set splitbelow
set splitright

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

augroup filetype_javascriptreact
    autocmd!
    autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2
    autocmd Filetype javascriptreact inoremap {<space> {<space><space>}<ESC>hi
    autocmd FileType javascriptreact :iabbrev <buffer> iff if ()<left>
augroup END
 
augroup filetype_typescript
    autocmd!
    autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2
    autocmd Filetype typescript inoremap {<space> {<space><space>}<ESC>hi
    autocmd FileType typescript :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_typescriptreact
    autocmd!
    autocmd Filetype typescriptreact setlocal tabstop=2 shiftwidth=2
    autocmd Filetype typescriptreact inoremap {<space> {<space><space>}<ESC>hi
    autocmd FileType typescriptreact :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_solidity
    autocmd!
    autocmd Filetype solidity setlocal tabstop=2 shiftwidth=2
    autocmd Filetype solidity inoremap {<space> {<space><space>}<ESC>hi
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

augroup filetype_scss
    autocmd!
    autocmd Filetype scss setlocal tabstop=2 shiftwidth=2
    autocmd Filetype scss inoremap <buffer> : :;<esc>i<space>
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
    autocmd Filetype md nnoremap / /\v\c
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
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
  let g:tagbar_sort = 0

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall

Plug 'posva/vim-vue'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'cespare/vim-toml'

Plug 'tomlion/vim-solidity'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
endif

Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{
    \ 'path': '~/wiki',
    \ 'ext': '.md',
\ }]
let g:vimwiki_conceallevel = 0
let g:vimwiki_markdown_link_ext = 1

Plug 'tools-life/taskwiki'
let g:taskwiki_markup_syntax = 'markdown'

call plug#end()

" }}}

" Mappings {{{
nnoremap <space> <nop>
nnoremap / /\v

" Insert a new line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

nnoremap <leader>s :update<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

" Explore
nnoremap <leader>n :Explore<CR>

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

nnoremap <leader>z :set invrnu invnu<CR>
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

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

" Goyo
nnoremap <leader><ENTER> :Goyo<CR>

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

" Search selected words
vnoremap <leader>/ y/<C-R>"<CR>

" Easy escape
inoremap jk <esc>
inoremap <esc> <nop>

" Auto-closings
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

" vimwiki
nnoremap <leader>vwi :VimwikiIndex<CR>
nnoremap <leader>vwd :VimwikiDiaryIndex<CR>
nnoremap <leader>vwmd :VimwikiMakeDiaryNote<CR>
nnoremap <leader>vwgd :VimwikiDiaryGenerateLinks<CR>

" }}}

" Golang settings {{{
" vim-go options
let g:go_template_autocreate = 0

" GoPls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Tagbar - gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
" }}}

" Miscellaneous {{{
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" Goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}
