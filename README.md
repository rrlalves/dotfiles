# dotfiles
  
$ git clone git@github.com:rrlalves/dotfiles.git
$ ln -s dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.vim/tmp
mkdir ~/.vim/bundle

E depois instalar os plugins:

$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim +PluginInstall +qall

https://github.com/ycm-core/YouCompleteMe

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
