# Mateus Queirós’s dotfiles

**[BETA README DO NOT TRY TO INSTALL THROUGH THE STEPS BELOW]**

![react demo](./screenshots/react-demo.png)

This is my configuration for a Neovim setup, mainly focused on React and Web development.

## Overview

- [Neovim](https://neovim.io/) config using [Lazy.nvim](https://github.com/folke/lazy.nvim)
- tmux
- zsh (Oh My Zsh + powerlevel10k)
- Windows Terrminal
- AutoHotkey bindings

### Requirements

- Neovim ≥ **0.9.0**
- Git
- LazyVim
- a Nerd Font (I use Liga SF Nerd Font)
- For Telescope:
    - ripgrep
    - fd
- Windows Terminal (or other terminal emulator)

## Script

A Bash Script is available to automatize the steps below for you!

How to use:

```bash
# Make sure you have tar installed
sudo apt update
sudo apt install tar

# Create a installation directory
mkdir ~/install-config
cd ~/install-config

# Download and extract the installation folder
curl https://codeload.github.com/mateuscqueiros/dotfiles/tar.gz/master | \tar -xz --strip=2 dotfiles-master/install

# Give exec permission to folder
chmod -R u+x ~/install-config

# Run the script
 echo "0" | ./install.sh
```

After that, restart your machine. Open Neovim and let Lazy install the plugins. Once possible, open a file and let Mason install the LSPs. Set a colorscheme through `:colorscheme rose-pine`. After all downloads finish, quit Neovim and reopen it. You are done!

## Step by step

This config is optimal for Debian or Ubuntu. My main workspace is Debian WSL. Make sure to not just blindly run the commands. Read the comments, as they add some important instructions and references.

### Git

Install git and clone this repo at your root.

```bash
sudo apt-get install git

git clone https://github.com/mateuscqueiros/dotfiles ~/.config
```

### Zsh

Install Zsh

```bash
sudo apt update
sudo apt install zsh -y
zsh --version

# Initialize ZSH
# When prompted press '0'
zsh
```

Install [Oh My Zsh](https://ohmyz.sh/#install):

```bash
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# When asked if you want to make ZSH your default sheel press 'Y'
```

Symlink `~/.config/zsh/.zshrc`:

```bash
rm -rf ~/.zshrc

ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

Download Oh My Zsh plugins:

```bash
# powerlevel10k
# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

Source `~/.zshrc`:

```bash
source ~/.zshrc
```

If you have not done it yet, set up SSH keys so Zsh can start the ssh-agent when you logiN.

If the content of `~/.config/zsh/.zshrc` was overwritten by Oh My Zsh at some point then copy and paste it from this repository.

### Tmux

```bash
sudo apt-get install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf
```

### Neovim

Install the following dependencies:

```bash
sudo apt-get install ripgrep
sudo apt-get install fd-find
```

Install Neovim from AppImage

```bash
# Make sure you are on root before all of this

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Clone the actual Neovim config to ~/.config/nvim
git clone https://github.com/mateuscqueiros/nvim.config ~/.config/nvim

# Start plugin installation by Lazy
nvim ~/.config/nvim
```

Once the installation process from Lazy is finished quit Neovim and run it again. That’s it!

Note: some errors related to coloschemes may appear. To fix that, just select a colorscheme and restart Neovim.
