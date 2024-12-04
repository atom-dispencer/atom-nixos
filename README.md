Install NixOS-WSL:
```ps1
wsl.....
```

After cloning, the first thing you should do is set up Git.
The SSH identity '~/.ssh/github_atom-nixos' is automatically used for GitHub authentication and key signing.

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


# Common Errors

## Failed to start home manager for atom (home-manager.lock permission denied)
```
× home-manager-atom.service - Home Manager environment for atom
     Loaded: loaded (/etc/systemd/system/home-manager-atom.service; enabled; preset: enabled)
     Active: failed (Result: exit-code) since Thu 2024-11-14 00:36:37 UTC; 448ms ago
    Process: 51433 ExecStart=/nix/store/kvmyzd34v9bw0bs5dwzadlfc6657nwdi-hm-setup-env /nix/store/6zixczbarzc2b89lmfyxgl2yqwbgx2lp-home-manager-generation (code=exited, status=1/FAILURE)
   Main PID: 51433 (code=exited, status=1/FAILURE)
         IP: 0B in, 0B out

Nov 14 00:36:37 nixos systemd[1]: Starting Home Manager environment for atom...
Nov 14 00:36:37 nixos hm-activate-atom[51433]: Starting Home Manager activation
Nov 14 00:36:37 nixos hm-activate-atom[51490]: error: opening lock file '/home/atom/.local/state/nix/profiles/home-manager.lock': Permission denied
Nov 14 00:36:37 nixos systemd[1]: home-manager-atom.service: Main process exited, code=exited, status=1/FAILURE
Nov 14 00:36:37 nixos systemd[1]: home-manager-atom.service: Failed with result 'exit-code'.
Nov 14 00:36:37 nixos systemd[1]: Failed to start Home Manager environment for atom.
warning: error(s) occurred while switching to the new configuration
```
Take ownership of home directory
```
sudo chown atom /home/atom/ -R
```
