echo "  Fetching Git repository..."
git pull


echo "  Updating submodules..."
git submodule update --init --recursive
git add . -A


echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --impure --flake .\?submodules=1


echo "  Deploying Neovim config..." 
NVIM_CONFIG=~/.config/nvim
rm "$NVIM_CONFIG" -rf
git clone https://github.com/atom-dispencer/atom-nvim.git "$NVIM_CONFIG"
