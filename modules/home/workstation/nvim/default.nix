{
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation.nvim;
in {
  options.nix-dotfiles.workstation.nvim = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup nvim");
  };
  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        set number relativenumber
        set clipboard+=unnamedplus
      '';
    };
  };
}
