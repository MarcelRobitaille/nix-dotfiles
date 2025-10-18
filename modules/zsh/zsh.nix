{ pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    plugins = [
      {
        name = "zsh-forgit";
        src = pkgs.zsh-forgit;
        file = "share/zsh/zsh-forgit/forgit.plugin.zsh";
      }
    ];
    # TODO: Split up ./zshrc into modules and source them from inlined initExtra
    # Don't replace .zshrc exactly with ./zshrc. It breaks plugins and such.
    initExtra = builtins.readFile ./zshrc;
  };
}
