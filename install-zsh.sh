#!/bin/bash

# Actualizar el sistema y instalar Zsh
sudo apt update && sudo apt upgrade
sudo apt install zsh -y

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Instalar Powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Instalar zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Instalar zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Cambiar el tema de Zsh
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Activar plugins en ~/.zshrc
sed -i 's/plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Instalar lsd
sudo apt install lsd

# Instalar bat
sudo apt install bat

# Añadir alias a ~/.zshrc
sed -i '/# alias ohmyzsh="mate ~\/.oh-my-zsh"/a\
alias ls='"'"'lsd'"'"'\
alias l='"'"'ls -l'"'"'\
alias la='"'"'ls -a'"'"'\
alias lla='"'"'ls -la'"'"'\
alias lt='"'"'ls --tree'"'"'\
alias cat='"'"'bat'"'"'
' ~/.zshrc

echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> -a ~/.zshrc 


