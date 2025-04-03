echo "  Fetching Git repository..."
git reset --hard HEAD
git pull


echo "  Updating submodules..."
git submodule update --init --recursive
git add . -A


echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --impure --flake ".?submodules=1#wsl"
if [ ! $? -eq 0 ]; then
echo "  Failed to rebuild NixOS!"
  exit 1
fi


echo "  Deploying Neovim config..." 
NVIM_CONFIG=~/.config/nvim
rm "$NVIM_CONFIG" -rf
git clone https://github.com/atom-dispencer/atom-nvim.git "$NVIM_CONFIG"
