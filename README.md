Install NixOS-WSL:
```ps1
wsl.....
```

Image

Clone the GitHub image:
```sh
# Open an ephemeral shell with Git
cd /etc/nixos/
nix-shell -p git

# Replace the old configuration with the new
sudo rm configuration.nix
sudo git clone https://github.com/atom-dispencer/atom-nixos .

# Activate the new configuration
sudo nixos-rebuild switch
```
