#!/bin/bash

echo "Adding Required Items For Setup, Ensure Being Run Through sudo"

echo "Setting Up rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing bob (NeoVIM Updater)"
cargo install bob-nvim

echo "Setting Up neovim"
bob install latest
bob use latest

echo "Setting Up ripgrep"
curl -LO \
    https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
