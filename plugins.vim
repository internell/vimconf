call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes


" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Miscellany
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter',
      \ { 'do': ':TSUpdate' }
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'


" Interface
Plug 'alok/notational-fzf-vim'
Plug 'andymass/vim-tradewinds'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'mattn/calendar-vim'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-vinegar'
Plug 'xolox/vim-session'


" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'andymass/vim-matchup'
Plug 'amadeus/vim-convert-color-to'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'numToStr/Comment.nvim', { 'tag': 'v0.6' }
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
" Plug 'scrooloose/nerdcommenter'
Plug 'tommcdo/vim-exchange'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'


" Syntax
Plug 'ap/vim-css-color',
      \ { 'for': ['css', 'less', 'scss', 'stylus'] }
Plug 'briancollins/vim-jst',
      \ { 'for': ['ejs', 'jst', 'djs', 'hamljs', 'ect'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'groenewege/vim-less',
      \ { 'for': 'less' }
Plug 'iloginow/vim-stylus'
Plug 'internell/Vim-Jinja2-Syntax'
Plug 'leafOfTree/vim-svelte-plugin',
      \ { 'for': 'svelte' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars',
      \ { 'for': ['handlebars', 'hbs', 'hdbs', 'hb', 'mustache', 'hogan', 'hulk', 'hjs' ] }
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
" Plug 'posva/vim-vue',
      " \ { 'for': 'vue' }
Plug 'p00f/nvim-ts-rainbow'
Plug 'leafoftree/vim-vue-plugin',
      \ { 'for': 'vue' }
Plug 'tpope/vim-markdown'
Plug 'vim-perl/vim-perl'
Plug 'Vimjas/vim-python-pep8-indent'


" Theming
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-thematic'


call plug#end()
