#!/bin/sh

sudo apt-get install git -y;

git clone https://github.com/mateuscqueiros/dotfiles ~/.config

sudo apt update -y;
sudo apt install zsh -y;

chsh -s $(which zsh)

zsh;

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y;

rm -rf ~/.zshrc;

ln -s ~/.config/zsh/.zshrc ~/.zshrc;

sudo apt-get install tmux -y;

ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

exit;
exit;

source ~/.zshrc;

sudo apt install ripgrep -y;
sudo apt install fd-find -y;

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage;
chmod u+x nvim.appimage;
sudo mv nvim.appimage /usr/local/bin/nvim;

git clone https://github.com/mateuscqueiros/nvim.config ~/.config/nvim

zsh;
