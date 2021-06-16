#!/bin/bash

red=`echo -en "\e[31m"`
cyan=`echo -en "\e[36m"`
default=`echo -en "\e[39m"`

clear

echo "${cyan}Do you want to create the dual boot?\n[Y/N]${default}"


read choice
case "$choice" in
    "y" | "Y")
sudo apt update && sudo apt upgrade -y
sudo apt install grub-efi grub2-common grub-customizer
sudo grub-install
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi
git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes
cd Top-5-Bootloader-Themes
sudo ./install.sh
        ;;
    "n" | "N")
        exit ;;
    *)
        echo "${red}Something unexpected happened"
        exit 255
esac
