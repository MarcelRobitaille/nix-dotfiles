{
  description = "Dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ (import neovim-nightly-overlay) ];
      };
        _ = builtins.trace "Available packages: ${builtins.attrNames pkgs}" pkgs;
    in {
      homeConfigurations."marcel" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./hosts/hermes.nix
          ./modules/desktop/desktop.nix
          ./modules/git/git.nix
          ./modules/nvim/nvim.nix
          ./modules/ssh/ssh.nix
          ./modules/tmux/tmux.nix
          ./modules/tmuxinator/tmuxinator.nix
          ./modules/zsh/zsh.nix
        ];
        extraSpecialArgs = {
          inherit system;
          inherit inputs;
        };
      };
    };
}
