call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes


" Interface
Plug 'alok/notational-fzf-vim'
Plug 'andymass/vim-tradewinds'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'mattn/calendar-vim'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-session'


" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'amadeus/vim-convert-color-to'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tommcdo/vim-exchange'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'


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
Plug 'posva/vim-vue'
Plug 'tpope/vim-markdown'
Plug 'vim-perl/vim-perl'
Plug 'Vimjas/vim-python-pep8-indent'


" Theming
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-thematic'


" Miscellany
Plug 'mhinz/vim-startify'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'


call plug#end()
