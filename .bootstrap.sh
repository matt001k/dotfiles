#!/bin/bash

echo "Adding Required Items For Setup, Ensure Being Run Through sudo"
sudo apt update
sudo apt install build-essential zlib1g-dev \
                 libncurses5-dev libgdbm-dev \
                 libnss3-dev libssl-dev \
                 libreadline-dev libffi-dev wget \
                 ca-certificates curl

echo "Installing Plugin Manager"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Setting Up rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Python"
sudo apt install python
sudo pip install virtualenv
sudo add-apt-repository ppa:deadsnakes/ppa

echo "Installing bob (NeoVIM Updater)"
cargo install bob-nvim

echo "Setting Up neovim"
bob install latest
bob use latest

echo "Installing bear"
sudo apt-get install bear

echo "Setting Up ripgrep"
curl -LO \
    https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
rm ripgrep_13.0.0_amd64.deb

echo "Setting Up Docker"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Updating Git"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com A1715D88E1DF1F24 40976EAF437D05B5 3B4FE6ACC0B21F32 A6616109451BBBF2
sudo apt-get install git -y
