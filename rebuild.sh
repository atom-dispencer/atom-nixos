sudo git pull
sudo git submodule update --init --recursive
sudo git add . -A
sudo nixos-rebuild switch --flake .\?submodules=1
