" borrows from: 
" https://gist.github.com/r00k/8fc7e4e9d35ccbfb64aa
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" http://www.terminally-incoherent.com/blog/2012/03/26/how-to-configure-vim/
" https://begriffs.com/posts/2019-07-19-history-use-vim.html
" no way that's an exhaustive list though



""""""""""""""
" BASIC CONFIG
""""""""""""""

set nocompatible
set encoding=utf-8

" filetype off
" enable file type detection and do language-dependent indenting
filetype plugin indent on
syntax on

set autoread

" much history
set history=1000

let mapleader = ","
" makes mapleader accessible within functions
let g:mapleader = ","
set timeout timeoutlen=1500

" fast saving
nmap <leader>w :w!<CR>

" a nicer return to normal mode
inoremap jj <Esc>

" press ; to issue commands in normal mode more lazily
nnoremap ; :

" pull up vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" reload vimrc
nmap <silent> <leader>rr :so $MYVIMRC<CR>

" shut up, vim
set visualbell
set noerrorbells



"""""""""""""""
" FILE HANDLING
"""""""""""""""

" begriffs' setup as follows seems sensible
" protect changes between writes
set swapfile
set directory^=~/.vim/swap//
" protect against crash during writing
set writebackup
" but don't persist backup
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto

" persist undo tree for each file
set undofile
set undodir^=~/.vim/undo//

let g:netrw_liststyle=1
" open file in previous window
let g:netrw_browse_split=4
let g:netrw_winsize=30
" doesn't actually appear to solve netrw buffers not wanting to close
let g:netrw_fastbrowse=0
" I want line numbering damn it
let g:netrw_bufsettings='noma nomod rnu nowrap ro nobl'

let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>



""""""""""""""""""""""""""""""""
" SEARCH, MATCHING, HIGHLIGHTING
""""""""""""""""""""""""""""""""

" finding files - search into subfolders
" provides tab completion for file-related tasks
" https://youtu.be/XA2WjJbmmoM?t=421
set path+=**

" display matches for tab completion
set wildmenu
set wildmode=list:longest,full

" prior to setting wildignore
if exists("g:ctrl_user_command")
    unlet g:ctrl_user_command
endif

set wildignore+=*/\.git/*,*/\.svn/*,*/node_modules/*,*/tmp/*,*/vendor/*
set wildignore+=*.DS_Store
" why would I want to open these in vim
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.zip,*.dmg,*.pkg

" highlight matches
set hlsearch
" clear highlights
nnoremap <leader>h :noh<cr>

" highlight line when jumping to next result
" https://youtu.be/aHm36-na4-4?t=345
nnoremap <silent> n  n:call HLNext(0.4)<cr>
nnoremap <silent> N  N:call HLNext(0.4)<cr>

function! HLNext(blinktime)
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

setglobal complete-=i

" don't automatically jump to the first result
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<space>



"""""""""""""""""""""""""
" INTERFACE / STATUS LINE
"""""""""""""""""""""""""

" because lightline already displays the mode
set noshowmode

" always show
set laststatus=2

" Recalculates word count after a pause in typing
" https://stackoverflow.com/a/116454
let g:word_count="<unknown>"
function! WordCount()
  return g:word_count
endfunction
function! UpdateWordCount()
  let s = system("wc -w ".expand("%p"))
  let parts = split(s, ' ')
  if len(parts) > 1
    let g:word_count = parts[0]
  endif
endfunction
augroup WordCounter
  autocmd! CursorHold * call UpdateWordCount()
  autocmd! CursorHoldI * call UpdateWordCount()
augroup END
" set updatetime=500

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \           [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'windowid', 'percent' ],
  \              [ 'wordcount' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'windowid', 'percent' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&readonly?"":""}', 
  \   'wordcount': '%{WordCount()} words',
  \   'windowid': '%{winnr()}',
  \ } }

" height of the command bar
set cmdheight=2
" display incomplete commands
set showcmd

set ruler

set number
set norelativenumber
" toggle relative line numbering
nnoremap <leader>rt :set rnu!<cr>

set colorcolumn=140

if has("gui_running")
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
  set guicursor=a:blinkon0
endif

" cursor crosshairs
set cursorline
set cursorcolumn

set listchars=tab:»\ ,eol:¬,nbsp:␣,trail:·,extends:›,precedes:‹
" a nice invisible char toggler
nmap <leader>l :set list!<CR>

set foldenable
set foldcolumn=3
set foldmethod=indent
set foldlevelstart=99

let g:startify_custom_header = ''
let g:startify_session_dir='~/.vim/sessions'
let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 0
let g:startify_lists = [
      \ { 'type': 'sessions', 'header': ['   Sessions'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'dir', 'header': ['   Directory '. getcwd()] },
      \ { 'type': 'files', 'header': ['   Files'] }
      \ ]



""""""""""""""""""""""""""""""""""""""""""""""
" NAVIGATION, TABS, WINDOWS, BUFFERS, SESSIONS
" JUST KIDDING ABOUT THE TABS
""""""""""""""""""""""""""""""""""""""""""""""

" sets title for terminal window
set title
" set titlestring = %{fnamemodify(this_session, ':t')}

" allow buffers in background, don't limit to 1 file per window/split
set hidden

" close the current buffer
nnoremap <leader>bd :bd<CR>

" close all buffers
nnoremap <leader>ba :bufdo bd<CR>

" https://github.com/romainl/the-patient-vimmer/blob/gh-pages/2.adoc#switching-buffers
nnoremap <leader>bb :ls<CR>:b<Space>
" nnoremap <leader>bb :buffer *

" https://stackoverflow.com/a/30101152
" close hidden buffers
function! DeleteHiddenBuffers()
  let tpbl = []
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction

nnoremap <leader>bc :call DeleteHiddenBuffers()<CR>

" https://stackoverflow.com/a/4468491
" close current open buffer and open previous buffer in same window
nnoremap <C-c> :bp\|bd #<cr>

" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitright

" cycle through tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,winpos,terminal

let g:screen_size_restore_pos = 1
let g:screen_size_by_vim_instance = 1
let g:session_directory = '~/.vim/sessions'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'



""""""""""""""""""""""""""
" EDITING / TEXT BEHAVIOUR
""""""""""""""""""""""""""

" newline in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" make backspace behave in a sane manner
set backspace=indent,eol,start

" indentation management
set tabstop=2 shiftwidth=2 softtabstop=-1
set expandtab
set autoindent
" copy previous indent on enter
" set copyindent

" remap splitjoin to avoid vim-surround collisions
nnoremap cJ :SplitjoinJoin<cr>
nnoremap cC :SplitjoinSplit<cr>

" don't let indentLine override conceal setting
augroup indentLine_disable
  autocmd!
  autocmd FileType startify :IndentLinesDisable
  autocmd FileType startify setlocal concealcursor="" conceallevel=0
  autocmd FileType vimwiki :IndentLinesDisable
  autocmd FileType vimwiki setlocal concealcursor="" conceallevel=0
augroup END

autocmd FileType tt2html setlocal tabstop=4 shiftwidth=4
autocmd FileType yaml setlocal tabstop=4 shiftwidth=4
autocmd FileType python setlocal equalprg=/usr/local/Cellar/pyenv/shims/reindent

" reselect block after indenting
" http://tilvim.com/2013/04/24/reindenting.html
vnoremap < <gv
vnoremap > >gv

" tab into new brackets/braces/what have you
" https://stackoverflow.com/a/18066591
inoremap <C-Return> <CR><C-o>==<C-o>O

" toggle paste mode (to paste properly indented text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" nicer word wrapping
set wrap
set linebreak
set nolist
set textwidth=140
set wrapmargin=0
" don't wrap while typing
set formatoptions-=t

" emmet remapping
let g:user_emmet_settings = {
  \ 'html.j2' : {
  \ 'extends' : 'html'
  \ } }

" multipurpose tab key stolen from Gary Bernhardt's vimrc
" indent at the beginning of a line, and otherwise do completion
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
  autocmd FileType vimwiki call textobj#quote#init({'educate': 1})
  autocmd FileType jinja call textobj#quote#init({'educate': 0})
  autocmd FileType tt2html call textobj#quote#init({'educate': 0})
  autocmd FileType text call textobj#quote#init()
augroup END

let g:textobj#quote#matchit = 1

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType vimwiki call textobj#sentence#init()
  autocmd FileType text call textobj#sentence#init()
augroup END



"""""""""""""""""""""""""""""""""""""
" COLOURS, FONTS, SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""

" I suspect a Venn diagram showing the intersection of 'Mac users' and 
" 'People who enjoy ligatures' might be pretty close to a circle
if has('gui_macvim')
  set macligatures
endif

" support me some bloody italics
set t_ZH=^[[3m
set t_ZR=^[[23m

let localfontsize = 12
let localfira = 'Fira Code'
let localpitch = 'Pitch-Medium'

let g:gruvbox_contrast_dark = 'soft'
" let g:gruvbox_contrast_light = 'soft'

if has("gui_running")
  " if has("gui_macvim")
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
    let localfontsize = 9
    let localfira = 'Fira Code Medium'
    " let localpitch = 'Pitch Light'
  endif
endif

let g:thematic#defaults = {
  \ 'linespace': 2,
  \ 'fullscreen': 0,
  \ 'lines': 85,
  \ 'columns': 160
  \ }
let g:thematic#themes = {
  \ 'fira':   { 'typeface': localfira,
              \ 'font-size': localfontsize,
              \ 'background': 'dark',
              \ 'colorscheme': 'gruvbox'
  \ },
  \ 'code':   { 'typeface': 'JetBrains Mono Regular',
              \ 'font-size': localfontsize,
              \ 'background': 'dark',
              \ 'colorscheme': 'gruvbox'
  \ },
  \ 'edit':   { 'typeface': 'IBM Plex Mono',
              \ 'font-size': localfontsize,
              \ 'background': 'dark',
              \ 'colorscheme': 'gruvbox'
  \ },
  \ 'write':  { 'typeface': 'IBM Plex Mono',
              \ 'font-size': localfontsize,
              \ 'background': 'light',
              \ 'colorscheme': 'gruvbox'
  \ } }
let g:thematic#theme_name = 'code'

nnoremap <leader>gwn :set columns=120<cr>
nnoremap <leader>gwr :set columns=160<cr>
nnoremap <leader>gww :set columns=340<cr>

set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
set termencoding=utf-8

if !has('gui_running')
  set t_Co=256
endif

" syntax highlighting for LESS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

autocmd BufNewFile,BufRead *.vue setfiletype vue
autocmd BufNewFile,BufRead *.njk setfiletype jinja
autocmd BufNewFile,BufRead *.svelte setfiletype svelte

" what use do I even have for modula files
autocmd BufNewFile,BufFilePre,BufRead,BufReadPost *.md setfiletype markdown

" colours for folds
" highlight Folded guibg=darkgrey
" highlight FoldColumn guibg=darkgrey



""""""""""""
" COMMENTING
""""""""""""

" space after comment delimiter
let g:NERDSpaceDelims = 1
" allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" this appears to be the best way to customize comments
let g:NERDCustomDelimiters = {
  \ 'less': { 'left': '//', 'right': '' },
  \ 'vue': { 'left': '//', 'right': '' } }



""""""""""""""
" FZF SETTINGS
""""""""""""""

" add fzf directory to runtimepath
set rtp+=~/.fzf

" add Wipeouts command from pull request: https://github.com/junegunn/fzf.vim/pull/733
let g:fzf_wipeout_command = 'bwipeout'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-d': 'bwipeout' }

" fzf files in current directory
nnoremap <leader>f :Files<cr>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--border']}, <bang>0)

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }



"""""""""""""""
" GOYO SETTINGS
"""""""""""""""

map <leader>gy :Goyo<CR>
let g:goyo_width='50%'
let g:goyo_height='85%'
let g:goyo_margin_top='3'
let g:goyo_margin_bottom='7'



""""""""""""""""""
" VIMWIKI SETTINGS
""""""""""""""""""

" https://vi.stackexchange.com/a/15571
function! MarkdownFolds()
  let thisline = getline(v:lnum)
  if match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart). ' ('.foldsize.' lines)'
endfunction

let g:vimwiki_folding = 'expr'
autocmd FileType vimwiki setlocal foldexpr=MarkdownFolds()
autocmd FileType vimwiki setlocal foldtext=MarkdownFoldText()

let g:vimwiki_global_ext = 0
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

function! LocalWikiCheck()
  if filereadable(expand('~/.vim/wikilist.vim'))
    source ~/.vim/wikilist.vim
  " else
    " echo "Local vimwiki list not found"
  endif
endfunction
call LocalWikiCheck()

" hyperspecific function to send deleted text into garbage file
function! DumpRegister(text)
  let file = '~/vimwiki/wmf/draft/garbage.md'
  let l:winview = winsaveview()
  exec writefile([a:text], expand(file), "a")
  windo e
  call winrestview(l:winview)
  echom "Garbagified: " . a:text
endfunction

