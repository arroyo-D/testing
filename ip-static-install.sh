#!/bin/bash

# Este script configura una dirección IP estática en Ubuntu Server 21.04

# Abre el archivo de configuración de red en modo escritura
sudo nano /etc/netplan/00-installer-config.yaml

# Edita el archivo de configuración de red
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s1:
      dhcp4: no
      addresses: [192.168.1.199/24]  # Tu dirección IP estática
      gateway4: 192.168.64.1  # La dirección IP de tu router
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]  # Opcional: Direcciones IP de servidores DNS que quieras usar

# Aplica los cambios en la configuración de red
sudo netplan apply
