
" 'boa' theme for vim and neovim

" Initialisation
" ==============
set background=dark
hi clear

if exists("syntax_on")
	  syntax reset
  endif
  let g:colors_name = "boa"

  " ColorPallete
  " ============
  " foreground(yellowish white) = #C2B7A9
  " background(browndark) = #171202
  " string(greenish) = #608F76
  " comment(brown) = #725749
  " conditional(pinky) = #E36660
  " statement(yellow) = #E36660
  " directory(blue) = #8598C6
  " constant(purple) = #A686B2
  " error(darkred) = #611818
  " function(orange) = #B69452
  " operator(bluish white) = #ABB6BA
  " todo(bright green) = #90C777
  " special(purple) = #A686B2

  " Basic Highlighting (see :help group-name)
  " =========================================
  hi Comment guifg=#725749 guibg=NONE gui=italic

  hi Constant guifg=#A686B2 guibg=NONE gui=NONE
  hi String guifg=#608F76 guibg=NONE gui=NONE
  " Character
  " Number
  " Boolean
  " Float

  hi Identifier guifg=#C2B7A9 guibg=NONE gui=NONE
  hi Function guifg=#B69452 guibg=NONE gui=NONE

  hi Statement guifg=#E36660 guibg=NONE gui=underline
  hi Conditional guifg=#E36660 guibg=NONE gui=NONE
  hi Repeat guifg=#E36660 guibg=NONE gui=NONE
  hi Label guifg=#E36660 guibg=NONE gui=NONE
  hi Operator guifg=#ABB6BA guibg=NONE gui=NONE
  hi Keyword guifg=#E36660 guibg=NONE gui=NONE
  hi Exception guifg=#E36660 guibg=NONE gui=NONE

  hi PreProc guifg=#E36660 guibg=NONE gui=NONE
  " Include"
  " Define"
  " Macro"
  " PreCondit"

  hi Type guifg=#8797C1 guibg=NONE gui=NONE
  " StorageClass"
  hi Structure guifg=#A686B2 guibg=NONE gui=NONE
  " Typedef"

  hi Special guifg=#A686B2 guibg=NONE gui=NONE
  " SpecialChar"
  " Tag"
  " Delimiter"
  " SpecialComment"
  " Debug"
  "
  hi Underlined guifg=NONE guibg=NONE gui=underline
  hi Ignore guifg=NONE guibg=NONE gui=NONE
  hi Error guifg=NONE guibg=#611818 gui=NONE
  hi Todo guifg=#90C777 guibg=NONE gui=bold

  " Extended Highlighting (see :help highlight-default)
  " ====================================================
  hi ColorColumn guifg=NONE guibg=#1F1B11 gui=NONE
  " Conceal"
  " Cursor"
  " CursorIM"
  hi CursorColumn guifg=NONE guibg=#1F1B11 gui=NONE
  hi CursorLine guifg=NONE guibg=#1F1B11 gui=NONE
  hi Directory guifg=#8598C6 guibg=NONE gui=NONE
  hi DiffAdd guifg=#a8a8a8 guibg=#3f593f gui=NONE
  hi DiffChange guifg=#a8a8a8 guibg=#3f3f59 gui=NONE
  hi DiffDelete guifg=#b39797 guibg=#733e3e gui=NONE
  hi DiffText guifg=#a8a8a8 guibg=#594936 gui=NONE
  hi ErrorMsg guifg=#E36660 guibg=NONE gui=bold
  hi VertSplit guifg=NONE guibg=#231811 gui=NONE
  hi Folded guifg=#8e8eb3 guibg=#322433 gui=NONE
  hi FoldColumn guifg=#8797C1 guibg=#231811 gui=NONE
  hi SignColumn guifg=NONE guibg=#231811 gui=NONE
  " Incsearch"
  hi LineNr guifg=#5A4C44 guibg=#231811 gui=NONE
  hi CursorLineNr guifg=#5F5048 guibg=#1F1B11 gui=NONE
  hi MatchParen guifg=#DBD3C9 guibg=#503C39 gui=NONE
  hi ModeMsg guifg=#608F76 guibg=NONE gui=NONE
  hi MoreMsg guifg=#608F76 guibg=NONE gui=NONE
  hi NonText guifg=#494949 guibg=NONE gui=NONE
  hi Pmenu guifg=#947D72 guibg=#292621 gui=NONE
  hi PmenuSel guifg=#96A6CF guibg=#252B2F gui=NONE
  hi PmenuSbar guifg=NONE guibg=#232019 gui=NONE
  hi PmenuThumb guifg=NONE guibg=#283238 gui=NONE
  hi Question guifg=#608F76 guibg=NONE gui=NONE
  hi Search guifg=NONE guibg=#0A3615 gui=NONE
  hi SpecialKey guifg=#636373 guibg=NONE gui=NONE
  hi SpellCap guifg=NONE guibg=#42421b gui=NONE
  hi SpellLocal guifg=NONE guibg=#42421b gui=NONE
  hi SpellRare guifg=NONE guibg=#42421b gui=NONE
  hi SpellBad guifg=NONE guibg=#4d1313 gui=NONE
  hi StatusLine guifg=NONE guibg=#48382f gui=NONE
  hi StatusLineNC guifg=#5A4C44 guibg=#231811 gui=NONE
  hi TabLine guifg=#5A4C44 guibg=#231811 gui=NONE
  hi TabLineFill guifg=#5A4C44 guibg=#231811 gui=NONE
  " TabLineSel"
  hi Title guifg=#B69452 guibg=NONE gui=NONE
  hi Visual guifg=NONE guibg=#283238 gui=NONE
  hi WarningMsg guifg=#B58B4E guibg=NONE gui=NONE
  hi WildMenu guifg=#CBD6DB guibg=#48382f gui=bold

  hi Normal guifg=#C2B7A9 guibg=#171202 gui=NONE

  " Quickfix window highlighting
  hi link qfLineNr Function
  hi link qfError Repeat
  " qfFileName"

  hi link yamlFlowMappingKey Function
  hi link yamlBlockMappingKey Function
  hi link yamlKeyValueDelimiter Operator
  hi link dosiniLabel Function
  hi rstHyperlinkTarget guifg=#608F76 guibg=NONE gui=underline

  " Vim Syntax Highlighting
  " =======================
  hi link vimVar Identifier
  hi link vimFunc Function
  hi link vimSetSep Normal
  hi link vimNotFunc Statement
  hi link vimUserFunc Function
  hi link helpSpecial Special
  hi link helpHeadline Repeat
  hi link vimCommand Repeat
  hi link vimEnvvar Type
  hi link vimOption Type
  hi helpExample guifg=#806456 guibg=NONE gui=NONE
  hi helpCommand guifg=#8A8A8A guibg=NONE gui=NONE
  hi helpURL guifg=#608F76 guibg=NONE gui=underline
  hi link helpHyperTextJump Type
  hi link helpHyperTextEntry Type
  hi link vimFgBgAttrib Constant
  hi link vimHiAttrib Constant

  " Python Syntax Highlighting
  " ==========================
  "  https://github.com/vim-python/python-syntax
  "  https://github.com/tweekmonster/django-plus.vim
  hi link pythonClass Function
  hi link pythonCoding Comment
  hi link pythonRun Comment
  hi pythonClassVar guifg=#ABB6BA guibg=NONE gui=italic
  hi link djangoQueryObject Function
  hi link djangoModelField Function
  hi link djangoModelsModule Normal
  hi link jediFat Constant
  hi pythonDocTest guifg=#557796 guibg=NONE gui=NONE
  hi pythonDocTest2 guifg=#557796 guibg=NONE gui=NONE

  " HTML Syntax Highlighting
  " ========================
  "  https://github.com/othree/html5.vim
  hi link htmlTag Repeat
  hi link htmlEndTag Repeat
  hi link htmlTagName Repeat
  hi link djangoVarBlock Normal
  hi link djangoTagBlock Normal
  hi link djangoStatement Special

  " JavaScript Syntax Highlighting
  " ==============================
  "  https://github.com/pangloss/vim-javascript
  "  https://github.com/othree/javascript-libraries-syntax.vim
  hi link jsFunction Statement
  hi link jsFuncCall Function
  hi link jsonBraces Operator
  hi link jsDomElemAttrs Operator
  hi link jsDomElemFuncs Function
  hi link jsHtmlElemAttrs Operator
  hi link jsHtmlElemFuncs Function
  hi link jsCssStyles Operator

  " CSS Syntax Highlighting
  " =======================
  "  https://github.com/hail2u/vim-css3-syntax
  " hi cssIdentifier
  " hi cssProp
  " hi cssAttributeSelector
  " hi lessClass
  " hi LessVariable

  " Markdown Syntax Highlighting
  " ============================
  "  https://github.com/plasticboy/vim-markdown
  hi mkdURL guifg=#8598c6 guibg=NONE gui=underline
  hi mkdLinkDef guifg=#E36660 guibg=NONE gui=NONE
  hi mkdLink guifg=#E36660 guibg=NONE gui=NONE
  hi mkdDelimiter guifg=#E36660 guibg=NONE gui=NONE
  hi mkdListItem guifg=#A686B2 guibg=NONE gui=NONE

  " Shell Syntax Highlighting
  " =============================
  hi link shLoop shConditional
  hi link shShellVariables Type
  hi link shFunction Function

  " XML Syntax Highlighting
  " =============================
  hi link xmlTag Repeat
  hi link xmlTagName xmlTag
  hi link xmlEndTag xmlTag

  " Syntastic Syntax Highlighting
  " =============================
  hi SyntasticErrorSign guifg=#E36660 guibg=NONE gui=bold
  hi SyntasticWarningSign guifg=#DD9460 guibg=NONE gui=bold

  " Easy-Motion Syntax Highlighting
  " ===============================
  hi EasyMotionIncCursor guifg=#171202 guibg=#725749 gui=NONE

  " Startify Syntax Highlighting
  " ============================
  hi link StartifyNumber Repeat
  hi link StartifySection String

  " CtrlP Highlighting
  " ===================
  hi link  CtrlPBufferHid   Function

  " Netrw Highlighting
  " ===================
  hi link  NetrwList   Type
  hi link  NetrwHidePat   Special

  " NERDTree Highlighting
  " =====================
  hi link  NERDTreeOpenable   String
  hi link  NERDTreeClosable   String
  hi link  NERDTreeHelp       Comment
  hi link  NERDTreeUp         Comment
  hi NERDTreeDirSlash guifg=#947d72 guibg=NONE gui=bold
  hi NERDTreeDir guifg=#8598C6 guibg=NONE gui=bold
  hi NERDTreeCWD guifg=#E36660 guibg=NONE gui=bold

  " Tagbar Highlighting
  " ===================
  hi link  TagbarType   Statement
  hi link  TagbarScope  Function
  hi link  TagbarFoldIcon  Function
  hi link  TagbarAccessProtected  Type

  " License
  " =======
  " Copyright (c) 2016 monkoose
  "
  " Permission is hereby granted, free of charge, to any person obtaining a copy
  " of this software and associated documentation files (the "Software"), to deal
  " in the Software without restriction, including without limitation the rights
  " to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  " copies of the Software, and to permit persons to whom the Software is
  " furnished to do so, subject to the following conditions:
  "
  " The above copyright notice and this permission notice shall be included in
  " all copies or substantial portions of the Software.
  "
  " THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  " IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  " FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  " AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  " LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  " OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  " THE SOFTWARE.
