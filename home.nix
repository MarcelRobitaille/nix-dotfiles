{ pkgs, ...}: {
  home.stateVersion = "24.05";
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";

    programs.git = {
      enable = true;
      userName  = "Marcel Robitaille";
      userEmail = "marcelrobitaille11@gmail.com";
    };

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

  programs.neovim = {
    enable = true;
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

  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
}
