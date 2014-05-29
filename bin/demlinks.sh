#!/bin/bash

$DOTFILES_HOME="$HOME/code/dotfiles"

## manage symlinks for dotfiles

# ~/bin/
ln -s "$DOTFILES_HOME/bin" "$HOME/bin"

# EMACS #
ln -s "$DOTFILES_HOME/emacsd" "$HOME/.emacs.d"

# MUTT #
ln -s "$DOTFILES_HOME/muttrc" "$HOME/.muttrc"
ln -s "$DOTFILES_HOME/offlineimaprc" "$HOME/.offlineimaprc"
ln -s "$DOTFILES_HOME/notmuch-config" "$HOME/.notmuch-config"
ln -s "$DOTFILES_HOME/urlview" "$HOME/.urlview"

# ZSH #
ln -s "$DOTFILES_HOME/zshrc" "$HOME/.zshrc"
