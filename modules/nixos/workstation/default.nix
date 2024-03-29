{
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation;
in {
  options.nix-dotfiles.workstation = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup workstation");
  };
  config = mkIf cfg.enable {
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
        users.enable = true;
        hardware-configuration.enable = true;
      };
      utils.nox.enable = true;
    };
    programs.firefox.enable = true;
  };
}
