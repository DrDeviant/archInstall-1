pacman -S grub efibootmgr intel-ucode networkmanager pipewire pipewire-pulse pipewire-alsa pipewire-media-session git firefox bitwarden xdg-desktop-portal obs-studio fish

systemctl enable NetworkManager

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo "en_US.UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen

echo "pc" >> /etc/hostname

useradd -m user
echo "Set password for root"
passwd
echo "Set password for user"
passwd user

chsh -s /bin/fish
chsh -s /bin/fish user

echo "user ALL=(ALL) ALL" >> /etc/sudoers

sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet radeon.cik_support=0 amdgpu.cik_support=1"/g' /etc/default/grub 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

exit
