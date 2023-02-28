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
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'


" Miscellany
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter',
      \ { 'do': ':TSUpdate' }
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-misc'


" Interface
Plug 'alok/notational-fzf-vim'
Plug 'andymass/vim-tradewinds'
" Plug 'ggandor/leap.nvim'
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
Plug 'briancollins/vim-jst',
      \ { 'for': ['ejs', 'jst', 'djs', 'hamljs', 'ect'] }
Plug 'ekalinin/Dockerfile.vim'
Plug 'groenewege/vim-less',
      \ { 'for': 'less' }
" Maddening note: if there are two plugins of differing origins but the same name,
" the one listed last will get installed, regardless of whether it's commented out.
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'internell/Vim-Jinja2-Syntax'
Plug 'iloginow/vim-stylus'
Plug 'leafOfTree/vim-svelte-plugin',
      \ { 'for': 'svelte' }
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mustache/vim-mustache-handlebars',
      \ { 'for': ['handlebars', 'hbs', 'hdbs', 'hb', 'mustache', 'hogan', 'hulk', 'hjs' ] }
Plug 'NvChad/nvim-colorizer.lua'
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


" Linting
let g:python3_host_prog = $HOME . '/.local/nvim-venv/nvim/bin/python'
Plug 'psf/black', { 'branch': 'stable' }


" Theming
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-thematic'


call plug#end()
