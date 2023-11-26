{...}: {
  imports = [
    ./autologin.nix
    ./boot.nix
    ./hardware.nix
    ./pkgs.nix
    ./hardware-configuration.nix
    ./syncthing.nix
  ];
}
