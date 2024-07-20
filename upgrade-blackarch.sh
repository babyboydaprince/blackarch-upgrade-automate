#!/bin/bash
# Check if the script is running as root
if [[ $EUID -ne 0 ]]; 
then
    echo
    printf "No magic can be done without ROOT...\nPlease use 'sudo'."
    exit 1
fi
    clear
    echo
    echo "BLACKARCH FRESH INSTALL ASSISTANT"
    echo
    sleep 2
    echo "Sit back and relax :D"
    sleep 2
    echo "But not too much wWizard, you are the copilot!"
    sleep 1 
    echo "Don't be lazy, be a Wizard ;D"
    clear

    echo
    echo "Editing /etc/pacman.conf  SigLevel  value to --> Never..."
    sleep 2
    sed -i'/^SigLlevel =/c\
    SigLevel = Never' /etc/pacman.conf
    clear

    printf "\nFixing gnupg keys..."
    sleep 2
    rm -rf /etc/pacman.d/gnupg
    pacman-key --init 
    pacman-key --populate archlinux blackarch
    pacman-key --update --keyserver keyserver.ubuntu.com
    clear
    echo "GNUPG keys fixed!"
    sleep 2
    clear
    
    printf "\nNOW PERFORMING FULL BLACKARCH UPGRADE + LINUX KERNEL...\n"
    pacman -Sy --noconfirm blackarch-keyring archlinux-keyring && pacman -Syu linux --overwrite='*' blackarch





# add user to sudoers - /etc/sudoers

# Alter  pacman.conf SigLevel to Never - /etc/pacman.conf

# fix gnupg keys - rm -rf/etc/pacman.d/gnupg
# rm -rf /etc/pacman.d/gnupg
# pacman-key --init
# pacman-key --populate archlinux blackarch
# pacman-key --update --keyserver keyserver.ubuntu.com

# enable DHCPCD
# systemctl enable dhcpcd
# systemctl enable dhcpcd@ens33.service
# dhcpcd
# ip link set ens33 up

# upgrade OS
# pacman -Syu --needed --overwrite='*' blackarch
# pacman -Sy blackarch-keyring archlinux-keyring && pacman -Syu
