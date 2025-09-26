{ pkgs, ...}: {
  xdg.configFile."tmuxinator".source = ./profiles;
}
