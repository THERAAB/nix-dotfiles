{...}: {
  imports = [
    ./users.nix
    ./system.nix
    ./sops.nix
    ./starship.nix
    ./persist.nix
    ./syncthing.nix
  ];
  nix-dotfiles = {
    workstation = {
      boot.enable = true;
      auto-upgrade.enable = true;
      configuration.enable = true;
      plymouth.enable = true;
      fish.enable = true;
      gnome.enable = true;
      hardware.enable = true;
    };
    utils.nox.enable = true;
  };
  programs.firefox.enable = true;
}
