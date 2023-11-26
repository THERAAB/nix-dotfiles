{...}: {
  imports = [
    ./boot.nix
    ./games.nix
    ./pkgs.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./syncthing.nix
  ];
}
