{...}: {
  imports = [
    ../../../share/nixos
    ./boot.nix
    ./games.nix
    ./pkgs.nix
    ./hardware-configuration.nix
    ./hardware.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
