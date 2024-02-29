#!/bin/bash

pacman -S --noconfirm base base-devel linux linux-firmware git neovim amd-ucode reflector grub efibootmgr networkmanager bluez bluez-utils --needed

ln -sf /usr/share/zoneinfo/Asia/Dhaka
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "archlinux" > /etc/hostname
echo "" > /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.0.1 archlinux.localdomain archlinux"

reflector --verbose --latest 200 --protocol https --protocol http --sort rate --save /etc/pacman.d/mirrorlist 
pacman -Syu --noconfirm
pacman -S --noconfirm firefox-developer-edition inetutils net-tools uwufetch ttf-dejavu ttf-fira-code ttf-firacode-nerd ttf-font-awesome tldr ripgrep kitty alacritty github-cli zsh lsd neofetch btop htop bat composer wget unrar zoxide unzip tmux ufw ranger python fzf flapack apache mariadb php php-apache php-gd php-pgsql php-xsl phpmyadmin lazygit nmap openssh --needed

systemctl enable bluetooth
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable mariadb.service --now
systemctl enable httpd --now

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

sleep 5
reeboot
