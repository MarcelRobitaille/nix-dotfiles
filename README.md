# NixOS dotfiles

Currently only for my Framework 16.

## Root NixOS configuration

The files from `/etc/nixos/` were moved to `./nixos/` and symlinked back.

```
cd /etc/nixos
sudo ln /home/marcel/.dotfiles/nixos/configuration.nix .
sudo ln /home/marcel/.dotfiles/nixos/hardware-configuration.nix .
```

## Home Manager

The rest of the configuration is through Home Manager.

The subfolders in `./modules/` hold the Nix configuration and additional files for modules such as Neovim and ZSH.
