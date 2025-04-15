{ pkgs, ...}: {
  programs.git = {
    enable = true;
    userName  = "Marcel Robitaille";
    userEmail = "marcelrobitaille11@gmail.com";
  };
}
