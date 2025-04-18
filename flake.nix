{
  description = "Dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations."marcel" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./hosts/hermes.nix
	  ./modules/git/git.nix
	  ./modules/nvim/nvim.nix
	  ./modules/tmux/tmux.nix
	  ./modules/zsh/zsh.nix
        ];
        extraSpecialArgs = { inherit system; };
      };
    };
}

