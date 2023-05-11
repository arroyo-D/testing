#!/bin/bash

# Actualiza el sistema operativo y los paquetes instalados
sudo apt update && sudo apt upgrade

# Instala Zsh
sudo apt install zsh lsd bat -y

# Cambia el shell por defecto a Zsh
chsh -s /bin/zshx

# Instala Oh My Zsh, un marco de trabajo para administrar la configuración de Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Instala el plugin de resaltado de sintaxis de Zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Instala el plugin de sugerencias automáticas de Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instala el tema Powerlevel10k para Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Cambia el tema de Zsh a Powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Activa los plugins zsh-autosuggestions y zsh-syntax-highlighting en el archivo .zshrc
sed -i 's/plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Añade aliases útiles para los comandos de lista de archivos y vista previa de archivos al archivo .zshrc
sed -i '/# alias ohmyzsh="mate ~\/.oh-my-zsh"/a\
alias ls='"'"'lsd'"'"'\
alias l='"'"'ls -l'"'"'\
alias la='"'"'ls -a'"'"'\
alias lla='"'"'ls -la'"'"'\
alias lt='"'"'ls --tree'"'"'\
alias cat='"'"'bat'"'"'
' ~/.zshrc

#reinicia la maquina 
sudo reboot
