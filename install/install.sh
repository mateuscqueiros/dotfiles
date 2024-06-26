#!/bin/sh

echo "Initiating download..."

sudo apt-get -qq -y update;

printf "Updated apt-get\n";

#!/bin/bash

# Path to the install_git.sh script
INSTALL_GIT="./git.sh"

# Check if the script exists and is executable
if [ -f "$INSTALL_GIT" ] && [ -x "$INSTALL_GIT" ]; then
    echo "Executing install_git.sh..."
    $INSTALL_GIT
else
    echo "git.sh not found or not executable."
    exit 1
fi

printf "Installed git\n";

git clone https://github.com/mateuscqueiros/dotfiles ~/.config

# ZSH
sudo apt-get -qq -y install zsh;

printf "Installed Zsh\n";

shutdown -r now;

sh -c "$(wget -q https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";

printf "Installed Oh My Zsh\n";

rm -rf ~/.zshrc;

ln -s ~/.config/zsh/.zshrc ~/.zshrc;

git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

printf "Installed Zsh Plugins\n";

# TMUX
sudo apt-get -qq -y install tmux;

ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

printf "Installed Tmux";

# Neovim
sudo apt-get -qq -y install ripgrep;

printf "Installed ripgrep\n";

sudo apt-get -qq -y install fd-find;

printf "Installed fd-find\n";

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage;
chmod u+x nvim.appimage;
sudo mv nvim.appimage /usr/local/bin/nvim;

printf "Installed Neovim\n";

git clone https://github.com/mateuscqueiros/nvim.config ~/.config/nvim;

# Set default shell
new_shell=$(which zsh);

if ! grep -q "$new_shell" /etc/shells; then
    printf "O shell $new_shell não está listado em /etc/shells\n"
    exit 1
fi

sudo chsh -s "$new_shell" "$USER";

if [ $? -eq 0 ]; then
    printf "Default shell was altered sucessfully.\n"
else
    printf "Failed to alted default shell\n"
    exit 1
fi
