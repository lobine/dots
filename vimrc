" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Use pluggins with
" Plug 'foo/bar'

Plug 'junegunn/goyo.vim'

Plug 'google/vim-jsonnet'

" Initialize plugin system
call plug#end()

" Be iMproved
if &compatible
  set nocompatible
endif

" TODO set to space ?
nnoremap <SPACE> <Nop>
let mapleader = " "

syntax on

" Highlight searched terms
set hlsearch

set number
set relativenumber

colorscheme delek
set encoding=utf-8

set scrolloff=5

" show existing tabs as 4 spaces
set tabstop=4
" when indenting with ">", use 4 space width
set shiftwidth=4
" when indenting with "tab"
set expandtab

" Set indent size
autocmd FileType *      set tabstop=8|set shiftwidth=8|set expandtab
autocmd FileType python set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType go     set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType yaml   set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType make   set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType html   set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType vue    set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType json   set tabstop=2|set shiftwidth=2|set noexpandtab

" ; is the same as :
nmap ; :
nmap ' :

" Set backspace as expected
set backspace=indent,eol,start

nmap [ {
nmap ] }

" Set default Goyo width to 120
" Function triggered when entering Goyo mode
function! s:GoyoSetWidth()
  let g:goyo_width = 120
endfunction
autocmd! User GoyoEnter nested call <SID>GoyoSetWidth()

map <Leader><SPACE> :Goyo<CR>

map <Leader>o :LF<CR>


set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Manually set filetypes per extension
augroup filedetecttype
  " Template manifests in VKS addons
  autocmd       BufNewFile,BufRead      *.yaml.tmpl,*.yml.ympl  set syntax=yaml
  " Template manifests for VKS deployment
  autocmd       BufNewFile,BufRead      *.yaml.j2,*.yml.j2      set syntax=yaml
augroup END

" Leader bindings

" Next and previous buffer on j/k
nmap <Leader>j :bnext<CR>
nmap <Leader>k :bprevious<CR>
" Close buffer, but not the split
nmap <Leader>d :b#<bar>bd#<CR>

" Split vertically, to the right
nmap <Leader>v :vsplit<CR>
" Split horizontally, below
nmap <Leader>h :split<CR>
" Open file explorer in a vertical split, to the left
nmap <Leader>V :leftabove Vexplore<CR>
" Open file explorer in a horizontal split, up
nmap <Leader>H :Sexplore<CR>

nmap <Leader>f *

" Scroll fast with Shift j/k
nmap <S-j> <C-f>
nmap <S-k> <C-b>
