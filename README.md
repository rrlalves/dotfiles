# dotfiles

$ git clone git@github.com:rrlalves/dotfiles.git
$ cp dotfiles/vimrc ~/.vimrc

mkdir ~/.vim/tmp
mkdir ~/.vim/bundle

E depois instalar os plugins:

$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim +PluginInstall +qall

