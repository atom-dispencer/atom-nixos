echo "  Fetching Git repository..."
sudo git pull

echo "  Updating submodules..."
sudo git submodule update --init --recursive
sudo git add . -A

#echo "  Preparing for symlinking..."
#sudo rm /home/atom/.config/nvim -r

echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --impure --flake .\?submodules=1
