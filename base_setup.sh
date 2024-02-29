git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/hind-sagar-biswas/dotfiles.git
git clone https://github.com/hind-sagar-biswas/nvim.git
git clone https://aur.archlinux.org/yay.git

mv nvim ~/.config/
cp dotfiles/.zshrc ~/
cp dotfiles/.tmux.conf ~/
cp dotfiles/kitty ~/.config/
cp dotfiles/neofetch ~/.config/
cp dotfiles/alacritty ~/.config/

cd yay
makepkg -si
yay -S --noconfirm ttf-quicksand-variable xdman pfetch visual-studio-code-bin --needed
cd ~

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install-latest-npm
