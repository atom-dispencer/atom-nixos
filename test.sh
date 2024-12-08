echo "  Testing NixOS..."
sudo nixos-rebuild test --impure --flake .\?submodules=1
