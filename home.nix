{ pkgs, ...}: {
  home.stateVersion = "24.05";
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
