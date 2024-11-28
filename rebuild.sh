echo "  Fetching Git repository..."
git pull

echo "  Updating submodules..."
git submodule update --init --recursive
git add . -A

echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --impure --flake .\?submodules=1

echo "  Deploying Neovim config..." 
NVIM_CONFIG="~/.config/nvim"
if [ ! -d "$NVIM_CONFIG/.git" ]; then
  git clone https://github.com/atom-dispencer/atom-nvim.git $NVIM_CONFIG
fi
cd $NVIM_CONFIG
git checkout master
git pull
