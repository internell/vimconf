" borrows from: 
" https://gist.github.com/r00k/8fc7e4e9d35ccbfb64aa
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" http://www.terminally-incoherent.com/blog/2012/03/26/how-to-configure-vim/
" no way that's an exhaustive list though


""""""""""""""""
" BASIC CONFIG
""""""""""""""""

set nocompatible
set encoding=utf-8

" get plugins going
execute pathogen#infect()

filetype off
" enable file type detection and do language-dependent indenting
filetype on
filetype plugin on
filetype indent on
syntax on

" much history
set history=1000

let mapleader = ","
" makes mapleader accessible within functions
let g:mapleader = ","
set timeout timeoutlen=1500

" fast saving
nmap <leader>w :w!<CR>

" a nicer return to normal mode
inoremap fd <Esc>

" press ; to issue commands in normal mode more lazily
nnoremap ; :

" pull up vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" reload vimrc
nmap <silent> <leader>rr :so $MYVIMRC<CR>

" shut up, vim
set visualbell
set noerrorbells

""""""""""""""""
" FILE HANDLING
""""""""""""""""

set nobackup
set nowritebackup
set noswapfile

" save on tabbing away
au FocusLost * :wa

" use tree mode as default view
let g:netrw_liststyle=3
" open file in previous buffer
let g:netrw_browse_split=4


""""""""""""""""
" SEARCH, MATCHING, HIGHLIGHTING
""""""""""""""""

" finding files - search into subfolders
" provides tab completion for file-related tasks
" https://youtu.be/XA2WjJbmmoM?t=421
set path+=**

" display matches for tab completion
set wildmenu
set wildmode=list:longest,full

set wildignore+=.git,.svn
set wildignore+=*.DS_Store
" why would I want to open these
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.zip,*.dmg,*.pkg

" highlight matches
set hlsearch
" clear highlights
nnoremap <leader>h :noh<cr>
" clear the damn pattern
:command C let @/=""

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

" highlight matching brackets
set showmatch

" incremental searching
set incsearch
" case-insensitive
set ignorecase
" ...unless containing 1+ capital letter
set smartcase

" for regex
set magic


""""""""""""""""
" COLOURS, FONTS, SYNTAX HIGHLIGHTING
""""""""""""""""

set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

set background=dark
colorscheme solarized
nnoremap <leader>1 :colorscheme solarized<cr>
nnoremap <leader>2 :colorscheme obsidian<cr>
nnoremap <leader>3 :colorscheme distinguished<cr>
nnoremap <leader>4 :colorscheme badwolf<cr>

" syntax highlighting for LESS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" set custom jinja2 delimiters
au FileType jinja syn region jinjaTagBlock matchgroup=jinjaTagDelim start=/\[%-\?/ end=/-\?%\]/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment
au FileType jinja syn region jinjaVarBlock matchgroup=jinjaVarDelim start=/\[\[-\?/ end=/-\?\]\]/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment
au FileType jinja syn region jinjaRaw matchgroup=jinjaRawDelim start="\[%\s*raw\s*%\]" end="\[%\s*endraw\s*%\]" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString,jinjaComment
au FileType jinja syn region jinjaComment matchgroup=jinjaCommentDelim start="\[#" end="#\]" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString

" what use do I even have for modula files
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

""""""""""""""""
" INTERFACE / STATUS LINE
""""""""""""""""

" because lightline already displays the mode
set noshowmode

" always show
set laststatus=2

" set statusline=\ %{v:register}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

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

" height of the command bar
set cmdheight=2
" display incomplete commands
set showcmd

set ruler

set number
set norelativenumber
" this switcheroo adapted from https://vi.stackexchange.com/a/7
" function! RelativeNumberToggle()
    " if(&relativenumber == 1)
        " set number
    " else
        " set relativenumber
    " endif
" endfunc
" nnoremap <leader>rt :call RelativeNumberToggle()<cr>
nnoremap <leader>rt :set rnu!<cr>

" cursor crosshairs
set cursorline
set cursorcolumn

set listchars=tab:»\ ,eol:¬,nbsp:␣,trail:·,extends:›,precedes:‹
" a nice invisible char toggler
nmap <leader>l :set list!<CR>


""""""""
" NAVIGATION, TABS, WINDOWS, BUFFERS
" JUST KIDDING ABOUT THE TABS
""""""""

" sets title for terminal window
set title

" allow buffers in background, don't limit to 1 file per window/split
set hidden

" close the current buffer
nnoremap <leader>bd :bd<CR>

" close all buffers
nnoremap <leader>ba :bufdo bd<CR>

" https://stackoverflow.com/a/4468491
" close current open buffer and open previous buffer in same window
nnoremap <C-c> :bp\|bd #<cr>

" return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" cycle through tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>


""""""""""""""""
" EDITING / TEXT BEHAVIOUR
""""""""""""""""

" newline in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" make backspace behave in a sane manner
set backspace=indent,eol,start

" tab management: set to 4 spaces
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

set autoindent
" copy previous indent on enter
set copyindent
set smartindent

" reselect block after indenting
" http://tilvim.com/2013/04/24/reindenting.html
vnoremap < <gv
vnoremap > >gv

" tab into new brackets/braces/what have you
" https://stackoverflow.com/a/14547523
inoremap {<CR> {<CR>}<C-o>O
" or use ctrl + return: https://stackoverflow.com/a/4477201
" imap <C-Return> <CR><CR><C-o>k<Tab>

" toggle paste mode (to paste properly indented text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" nicer word wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" don't wrap while typing
set formatoptions-=t

" emmet remapping
let g:user_emmet_leader_key='<C-e>'

" the following stolen remorselessly from Steve Losh's vimrc 
" fast open
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" multipurpose tab key stolen from Gary Bernhardt's vimrc
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" smart quote stuff with vim-textobj-quote
augroup textobj_quote
    autocmd!
    autocmd FileType markdown call textobj#quote#init({'educate': 0})
    autocmd FileType text call textobj#quote#init()
augroup END

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight


""""""""""""""""
" COMMENTING
""""""""""""""""

" space after comment delimiter
let g:NERDSpaceDelims = 1
" allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" this appears to be the best way to customize lesscss comments
let g:NERDCustomDelimiters = { 'less': { 'left': '//','right': '' } }


""""""""""""""""
" GOYO SETTINGS
""""""""""""""""

map <leader>g :Goyo<CR>
let g:goyo_width='80%'
let g:goyo_height='70%'
let g:goyo_linenr=1
