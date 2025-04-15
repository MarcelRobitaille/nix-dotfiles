{ config, lib, pkgs, inputs, ... }:
let
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
in
{
  programs.neovim = {
    enable = true;
    package = neovim;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    extraPackages = with pkgs; [
      gcc         # required for some plugins with native extensions
      tree-sitter # syntax highlighting engine
      unzip       # helps Packer unzip plugins
      ripgrep     # optional: useful for telescope
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
}
