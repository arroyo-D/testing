#!/bin/bash

# Define la interfaz de red que deseas configurar con IP estática
interface="enp0s1"

# Define la dirección IP, la máscara de red y la puerta de enlace que deseas utilizar
ip_address="192.168.64.199"
subnet_mask="255.255.255.0"
gateway="192.168.64.1"

# Edita el archivo de configuración de red
sudo tee /etc/netplan/00-installer-config.yaml >/dev/null <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s1:
      dhcp4: no
      addresses: [192.168.64.199/24]
      routes:
        - to: 0.0.0.0/0
          via: 192.168.64.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF

# Aplica la nueva configuración de red
sudo netplan apply
