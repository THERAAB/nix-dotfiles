{
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation.git;
in {
  options.nix-dotfiles.workstation.git = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup git");
    config-dir = mkOption {
      type = str;
    };
  };
  config = mkIf cfg.enable {
    programs.git = {
      includes = [
        {path = "${cfg.config-dir}/.gitconfig";}
      ];
      enable = true;
      userName = "THERAAB";
      extraConfig = {
        push.autoSetupRemote = true;
      };
    };
  };
}
