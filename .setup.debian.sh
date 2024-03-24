#!/bin/bash
# bootstrap
# sudo apt-get update && sudo apt-get install -y git && rm .bash* .profile && git init && git remote add origin https://github.com/sportshead/dotfiles.git && git fetch && git checkout master && source .bash_profile && source .setup.debian.sh

sudo apt-get update
sudo apt-get install -y libc6 libc6-i386 curl wget git build-essential cmake gdb \
    bat file fuse cmake clang zip 7zip zstd fzf ripgrep fd-find coreutils binutils \
    gpg ca-certificates gettext

sudo ln -s /usr/bin/batcat /usr/bin/bat

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
source ./.setup.fnm.sh
cargo install git-delta

wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
rm go1.22.1.linux-amd64.tar.gz

go install github.com/jesseduffield/lazygit@latest

git submodule init
git submodule update

wget -O .bin/nvim https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x .bin/nvim
nvim --headless +"Lazy! sync" +qa

sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
