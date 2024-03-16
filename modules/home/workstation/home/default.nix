{
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation.home;
in {
  options.nix-dotfiles.workstation.home = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup home");
  };
  config = mkIf cfg.enable {
    home = {
      username = "raab";
      homeDirectory = "/home/raab";
      stateVersion = "23.11";
    };
    programs.home-manager.enable = true;
  };
}
