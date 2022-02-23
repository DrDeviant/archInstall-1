timedatectl set-ntp true
mkfs.ext4 /dev/sdb2
mkfs.fat -F 32 /dev/sdb1
mount /dev/sdb2 /mnt
mkdir /mnt/boot
mount /dev/sdb1 /mnt/boot

pacstrap /mnt base base-devel linux linux-firmware git grub efibootmgr intel-ucode networkmanager pipewire pipewire-pulse pipewire-alsa pipewire-media-session git firefox discord bitwarden xdg-desktop-portal obs-studio fish noto-fonts-extra noto-fonts-cjk noto-fonts-emoji
genfstab -U /mnt >> /mnt/etc/fstab

cp -r archinstall /mnt/home/
arch-chroot /mnt sh /mnt/home/archinstall/archPostInstall.sh
