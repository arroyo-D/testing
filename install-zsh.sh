#!/bin/bash

# Actualiza el sistema operativo y los paquetes instalados
sudo apt update && sudo apt upgrade

# Instala Zsh
sudo apt install zsh -y

# Cambia el shell por defecto a Zsh
chsh -s /bin/zsh

# Instala el paquete de la utilidad de lista de archivos lsd
sudo apt install lsd

# Instala el paquete de la utilidad de vista previa de archivos bat
sudo apt install bat

# Instala el tema Powerlevel10k para Zsh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Instala Oh My Zsh, un marco de trabajo para administrar la configuración de Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Instala el plugin de resaltado de sintaxis de Zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Instala el plugin de sugerencias automáticas de Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Cambia el tema de Zsh a Powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Activa los plugins zsh-autosuggestions y zsh-syntax-highlighting en el archivo .zshrc
sed -i 's/plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Instala el paquete de la utilidad de lista de archivos lsd nuevamente (puede que haya sido removido por Oh My Zsh)
sudo apt install lsd

# Instala el paquete de la utilidad de vista previa de archivos bat nuevamente (puede que haya sido removido por Oh My Zsh)
sudo apt install bat

# Añade aliases útiles para los comandos de lista de archivos y vista previa de archivos al archivo .zshrc
sed -i '/# alias ohmyzsh="mate ~\/.oh-my-zsh"/a\
alias ls='"'"'lsd'"'"'\
alias l='"'"'ls -l'"'"'\
alias la='"'"'ls -a'"'"'\
alias lla='"'"'ls -la'"'"'\
alias lt='"'"'ls --tree'"'"'\
alias cat='"'"'bat'"'"'
' ~/.zshrc

# Añade una línea para cargar la configuración del tema Powerlevel10k en el archivo .zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc 

# Configura el tema Powerlevel10k
p10k configure
