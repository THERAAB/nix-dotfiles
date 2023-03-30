{ config, pkgs, ... }:
{
  environment.shells = with pkgs; [ fish ];
  users.defaultUserShell = pkgs.fish;
  home.sessionVariables.BAT_THEME = "Nord";
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      zoxide init --cmd cd fish | source
    '';
    shellAliases = {
      update-channels = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_channel";
      update-flake = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_flake";
      update-full-with-git = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_full";
      update-git-dotfiles = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_dotfiles_git";
      garbage-collect-all = "/nix/persist/nix-dotfiles/nixos-update-manager.sh gc";
      ls = "exa";
      la = "exa -lah";
      vi = "nvim";
      grep = "rg";
      ps = "procs";
      du = "dust";
      htop = "btm";
    };
  };
}
