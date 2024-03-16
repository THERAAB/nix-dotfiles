{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation.fish;
in {
  options.nix-dotfiles.workstation.fish = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup fish");
  };
  config = mkIf cfg.enable {
    environment.shells = with pkgs; [fish];
    users.defaultUserShell = pkgs.fish;
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };
  };
}
