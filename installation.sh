#!/bin/sh

sudo apt-get install git -y;

git clone https://github.com/mateuscqueiros/dotfiles ~/.config

sudo apt update -y;
sudo apt install zsh -y;
zsh;

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y;

rm -rf ~/.zshrc;

ln -s ~/.config/zsh/.zshrc ~/.zshrc;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;

zsh;

sudo apt-get install tmux -y;

source ~/.zshrc;

tmux source ~/.config/tmux/tmux.conf

sudo apt install ripgrep -y;
sudo apt install fd-find -y;

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage;
chmod u+x nvim.appimage;
sudo mv nvim.appimage /usr/local/bin/nvim;

git clone https://github.com/mateuscqueiros/nvim.config ~/.config/nvim

zsh;
