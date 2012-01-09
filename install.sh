#!/bin/sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}
DIR="$(pwd)"

echo "Working in $DIR"

# Backup existing .vim stuff
echo "1/6 Backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done

# Delete old .vim and .vimrc in $HOME
echo "2/6 Deleting old .vim and .vimrc in $HOME\n"
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc

echo "3/6 Installing Vundle in $DIR/.vim/bundle"
mkdir -p $DIR/.vim/bundle
git clone http://github.com/gmarik/vundle.git $DIR/.vim/bundle/vundle

echo "4/6 Making symbolic links"
ln -s $DIR/.vim $HOME/.vim
ln -s $DIR/.vimrc $HOME/.vimrc


echo "5/6 Installing Vim plugins (from .vimrc vundle's config)"
vim +BundleInstall! +BundleClean +q!

# Build command-t for your system
echo "6/6 building command-t executable (command-t depends on ruby and rake to be present)\n"
cd $DIR/.vim/bundle/Command-T
(rake make) || warn "Ruby compilation failed. Ruby, GCC or rake not installed?"

echo "Done."
