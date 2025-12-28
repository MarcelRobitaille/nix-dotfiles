{ pkgs, ...}: {
  xdg.configFile."rofi/config.rasi".source = ./rofi-config.rasi;
  xdg.configFile."rofi-pass/config".source = ./rofi-pass-config;
}
