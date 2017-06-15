from 
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

## Get it going

```bash
git clone https://github.com/janoewen/vimconf ~/.vim
echo 'runtime vimrc' >> ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```
