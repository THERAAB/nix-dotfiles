{...}: {
  imports = [
    ./plymouth
    ./hardware.nix
    ./users.nix
    ./system.nix
    ./configuration.nix
    ./sops.nix
    ./gnome.nix
    ./fish.nix
    ./starship.nix
    ./persist.nix
    ./pkgs.nix
    ./boot.nix
    ./syncthing.nix
    ./auto-upgrade.nix
    ./firefox.nix
    ./nox.nix
  ];
}
