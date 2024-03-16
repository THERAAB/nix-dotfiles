{...}: {
  imports = [
    ./pkgs.nix
    ./gnome.nix
    ./wall.nix
  ];
  nix-dotfiles = {
    workstation.enable = true;
    programs.libinput-gestures.enable = true;
  };
}
