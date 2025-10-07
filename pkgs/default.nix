# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs:
with pkgs; {
  stm32cubeprogrammer = callPackage ./stm32cubeprogrammer.nix {};
}

