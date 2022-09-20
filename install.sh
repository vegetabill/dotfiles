#!/usr/bin/env zsh

echo "this assumes you checked out this repo into ~/dotfiles"


# Just showing off that cd with no args goes home 🤪
cd

for f in .profile .zshrc .tmux.conf .vimrc .gitconfig .gitignore
do
    rm $f
    ln -s ~/dotfiles/${f} ${f}
done

echo "✅✅✅✅✅✅✅✅✅✅✅"
