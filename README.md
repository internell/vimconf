
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/  
http://dudarev.com/blog/keep-vim-settings-and-plugins-in-git-repo/  
http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules

## Get it going

```bash
git clone https://github.com/internell/vimconf ~/.vim
echo 'runtime vimrc' >> ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```
