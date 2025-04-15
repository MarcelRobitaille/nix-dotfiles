flake-path := "~/.dotfiles"
user := "marcel"

# Nix garbage collection
gc:
  nix-collect-garbage -d

# Update all flake inputs
update:
  nix flake update {{flake-path}}

# Apply Home Manager config
switch:
  home-manager switch --flake {{flake-path}}
