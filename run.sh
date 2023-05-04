#!/bin/sh

# Download .zshrc
curl -L https://raw.githubusercontent.com/e205723/dotfiles/main/.zshrc -o ~/.zshrc

# Download .tmux.conf
curl -L https://raw.githubusercontent.com/e205723/dotfiles/main/.tmux.conf -o ~/.tmux.conf

# Download karabiner.json
curl -L https://raw.githubusercontent.com/e205723/dotfiles/main/.config/karabiner/karabiner.json -o ~/.config/karabiner/karabiner.json --create-dirs
