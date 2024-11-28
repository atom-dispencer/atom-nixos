echo "  Fetching Git repository..."
sudo git pull

echo "  Updating submodules..."
sudo git submodule update --init --recursive
sudo git add . -A

echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --flake .\?submodules=1
