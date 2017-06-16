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

execute pathogen#infect()
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
syntax on


" finding files - search into subfolders
" provides tab completion for file-related tasks
" https://youtu.be/XA2WjJbmmoM?t=421
set path+=**

" display matches for tab completion
set wildmenu
set wildmode=list:longest,full



""""""""
" USER INTERFACE more or less
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


" Show line numbers in hybrid mode
set relativenumber
set number
" this switcheroo adapted from https://vi.stackexchange.com/a/7
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>nt :call NumberToggle()<cr>

" height of the command bar
set cmdheight=2
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
" much history
set history=100

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


""""""""
" highlighting
""""""""

" highlight matches
set hlsearch
" and clear
nnoremap <leader>h :noh<cr>

" highlight line when jumping to next result
" https://youtu.be/aHm36-na4-4?t=345
nnoremap <silent> n  n:call HLNext(0.4)<cr>
nnoremap <silent> N  N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction


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

" newline in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>


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
