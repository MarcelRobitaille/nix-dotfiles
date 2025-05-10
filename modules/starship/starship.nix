{ pkgs, ...}: {
  xdg.configFile."starship/starship.toml".source = ./starship.toml;
}
