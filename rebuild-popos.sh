echo "  Fetching Git repository..."
git reset --hard HEAD
git pull


echo "  Updating submodules..."
git submodule update --init --recursive
git add . -A


echo "  Rebuilding NixOS..."
nix run home-manager -- switch --flake ".?submodules=1#popos"
if [ ! $? -eq 0 ]; then
echo "  Failed to rebuild Nix Home Manager!"
  exit 1
fi


echo "  Deploying Neovim config..." 
NVIM_CONFIG=~/.config/nvim
rm "$NVIM_CONFIG" -rf
git clone https://github.com/atom-dispencer/atom-nvim.git "$NVIM_CONFIG"
