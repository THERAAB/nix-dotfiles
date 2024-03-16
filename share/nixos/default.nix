{...}: {
  imports = [
    ./users.nix
    ./sops.nix
    ./persist.nix
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
      starship.enable = true;
      syncthing.enable = true;
      system.enable = true;
    };
    utils.nox.enable = true;
  };
  programs.firefox.enable = true;
}
