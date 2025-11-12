# NixOS dotfiles

Currently only for my Framework 16.

## Root NixOS configuration

The files from `/etc/nixos/` were moved to `./nixos/` and symlinked back.

```
git clone https://github.com/MarcelRobitaille/nix-dotfiles.git ~/.dotfiles
cd /etc/nixos
sudo ln ~/.dotfiles/nixos/configuration.nix .
sudo ln ~/.dotfiles/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch
```

## Home Manager

The rest of the configuration is through Home Manager.

The subfolders in `./modules/` hold the Nix configuration and additional files for modules such as Neovim and ZSH.

### Getting started with home manager

```
git clone https://github.com/MarcelRobitaille/nix-dotfiles.git ~/.dotfiles
nix flake update ~/.dotfiles
```
