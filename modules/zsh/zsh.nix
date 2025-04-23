{ pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  home.file.".zshrc".source = ./zshrc;
}
