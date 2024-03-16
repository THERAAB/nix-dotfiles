{...}: {
  imports = [
    ./hardware.nix
    ./users.nix
    ./system.nix
    ./sops.nix
    ./starship.nix
    ./persist.nix
    ./pkgs.nix
    ./syncthing.nix
    ./nox.nix
  ];
  nix-dotfiles.workstation = {
    boot.enable = true;
    auto-upgrade.enable = true;
    configuration.enable = true;
    plymouth.enable = true;
    fish.enable = true;
    gnome.enable = true;
  };
  programs.firefox.enable = true;
}
