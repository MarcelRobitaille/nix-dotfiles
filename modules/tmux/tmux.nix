{ pkgs, ...}: {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    shortcut = "a"; # for Ctrl-a prefix
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
  };

  home.file.".tmux.conf".source = ./tmux.conf;
}
