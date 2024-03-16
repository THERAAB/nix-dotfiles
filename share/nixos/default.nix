{...}: {
  imports = [
    ./hardware.nix
    ./users.nix
    ./system.nix
    ./sops.nix
    ./gnome.nix
    ./fish.nix
    ./starship.nix
    ./persist.nix
    ./pkgs.nix
    ./syncthing.nix
    ./firefox.nix
    ./nox.nix
  ];
  nix-dotfiles.workstation = {
    boot.enable = true;
    auto-upgrade.enable = true;
    configuration.enable = true;
    plymouth.enable = true;
  };
}
