
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/  
http://dudarev.com/blog/keep-vim-settings-and-plugins-in-git-repo/  
http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules
https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule/1260982#1260982

## Get it going

```bash
git clone https://github.com/internell/vimconf ~/.vim
echo 'runtime vimrc' >> ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

## Set up wikilist.vim

```vim
let example_wiki = {}
let example_wiki.path = '~/vimwiki/'
let example_wiki.syntax = 'markdown'
let example_wiki.ext = '.md'
let example_wiki.nested_syntaxes = {'html': 'html', 'javascript': 'javascript', 'css': 'css', 'python': 'python'}

let g:vimwiki_list = [example_wiki]
```
