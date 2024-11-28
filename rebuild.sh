echo "  Fetching Git repository..."
git pull


echo "  Updating submodules..."
git submodule update --init --recursive
git add . -A


echo "  Rebuilding NixOS..."
sudo nixos-rebuild switch --impure --flake .\?submodules=1


echo "  Deploying Neovim config..." 
NVIM_CONFIG='~/.config/nvim'

rm "$NVIM_CONFIG" -rf
if [ ! $? -eq 0 ]; then
  echo "Couldn't delete old Neovim configuration"
fi

cd "$NVIM_CONFIG"
git checkout master
git pull
