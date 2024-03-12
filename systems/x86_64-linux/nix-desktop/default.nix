{...}: {
  imports = [
    ./boot.nix
    ./games.nix
    ./pkgs.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ../../../share/nixos
  ];
}
