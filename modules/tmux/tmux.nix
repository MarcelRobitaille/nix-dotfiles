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
    extraConfig = ''
          # Pane movement
      bind-key -n M-h select-pane -L
      bind-key -n M-j select-pane -D
      bind-key -n M-k select-pane -U
      bind-key -n M-l select-pane -R
    '';
  };
}
