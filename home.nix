{ pkgs, ...}: {
  home.stateVersion = "24.05";
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";
  home.sessionVariables = {
    # Fix 777 directories being unreadable blue on green
    LS_COLORS = "di=34:ow=33:tw=37"; # directories blue, world-writable yellow, sticky white
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
