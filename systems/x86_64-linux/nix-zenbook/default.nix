{...}: {
  imports = [
    ../../../share/nixos
    ./hardware.nix
    ./pkgs.nix
    ./hardware-configuration.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
