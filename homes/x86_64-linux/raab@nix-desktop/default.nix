{...}: {
  imports = [
    ./nix-scripts
    ./mangohud.nix
    ./pkgs.nix
    ./steam.nix
    ./gnome.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
