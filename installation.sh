#!/bin/sh

sudo apt-get install git -y;

git clone https://github.com/mateuscqueiros/dotfiles ~/.config

# ZSH
sudo apt update -y;
sudo apt install zsh -y;

echo "HERE ===================================================================================================================================="

echo $password | chsh -s $(which zsh);

echo "HERE ===================================================================================================================================="

shutdown -r now;

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y;

rm -rf ~/.zshrc;

ln -s ~/.config/zsh/.zshrc ~/.zshrc;

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# TMUX
sudo apt-get install tmux -y;

ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

# Neovim
sudo apt install ripgrep -y;
sudo apt install fd-find -y;

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage;
chmod u+x nvim.appimage;
sudo mv nvim.appimage /usr/local/bin/nvim;

git clone https://github.com/mateuscqueiros/nvim.config ~/.config/nvim;

# Set default shell
new_shell=$(which zsh);

if ! grep -q "$new_shell" /etc/shells; then
    echo "O shell $new_shell não está listado em /etc/shells"
    exit 1
fi

sudo chsh -s "$new_shell" "$USER";

if [ $? -eq 0 ]; then
    echo "O shell padrão foi alterado para $new_shell com sucesso."
else
    echo "Falha ao alterar o shell padrão."
    exit 1
fi

zsh;

source ~/.zshrc;

