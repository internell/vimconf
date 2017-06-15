" adapted from: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
" and: https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

set encoding=utf-8

set backup
" put 'em here
set backupdir=~/.vim/backups
" and for the swap files
set dir=~/.vim/backups

let mapleader = ","
set timeout timeoutlen=1500

map <leader>rr :source ~/.vimrc<CR>

" fast saving
nmap <leader>w :w!<CR>

" :W sudo saves the file
" command W w !sudo tee % > /dev/null

execute pathogen#infect()
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
syntax on

""""""""
" USER INTERFACE
""""""""

set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" because lightline displays the mode
set noshowmode

set background=dark
colorscheme solarized

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}', 
      \ }
      \ }

inoremap jj <Esc>

" height of the command bar
set cmdheight=2
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Show line numbers in hybrid mode
set relativenumber
set number
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
" much history
set history=100

set wildmenu
set wildmode=list:longest,full

" tab management: set to 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
" set smartindent
set autoindent
" nicer word wrapping
set wrap linebreak nolist
set textwidth=0
set wrapmargin=0

set ruler

" highlight matches
set hlsearch
" incremental searching
set incsearch
" case-insensitive
set ignorecase
" ...unless containing 1+ capital letter
set smartcase

" for regex
set magic

set listchars=tab:»\ ,eol:¬,nbsp:·,trail:·,extends:›,precedes:‹
nmap <leader>l :set list!<CR>

let g:netrw_liststyle=3    " use tree mode as default view
let g:netrw_browse_split=4 " open file in previous buffer


""""""""
" navigation, tabs, windows, buffers
""""""""

set title

" close the current buffer
map <leader>bd :bd<CR>

" close all buffers
map <leader>ba :bufdo bd<CR>

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""
" status line
""""""""

" always show
set laststatus=2

" set statusline=\ %{v:register}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" syntax highlighting for LESS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

""""""""
" goyo
""""""""

map <leader>g :Goyo
let g:goyo_width='80%'
let g:goyo_height='70%'
let g:goyo_linenr=1
