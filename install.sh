#!/bin/bash

function symlinkifne {
    if [[ -e $1 ]]; then
        if [[ -L $1 ]]; then
            echo "$1 already exists"
            return
        fi
        if [[ ! -e ~/.dotfiles_backup/$1 ]]; then
            mv $1 ~/.dotfiles_backup/
            echo "backed up $1"
        fi
    fi
    ln -sv .dotfiles/files/$1 ~/$1
}

GLOBIGNORE=".:.."

if [[ ! -e ~/.dotfiles_backup ]]; then
    mkdir ~/.dotfiles_backup
fi

for file in ~/.dotfiles/files/*; do
    symlinkifne "${file##*/}"
done
