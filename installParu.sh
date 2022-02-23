sudo pacman -S rustup
rustup toolchain install stable
mkdir -p ~/Documents/Code/Clones
cd ~/Documents/Code/Clones
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
