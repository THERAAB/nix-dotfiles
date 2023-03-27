{ config, pkgs, ... }:
{
  environment.shells = with pkgs; [ fish ];
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    shellAliases = {
      update-channels = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_channel";
      update-flake = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_flake";
      update-full-with-git = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_full";
      update-git-dotfiles = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_dotfiles_git";
      garbage-collect-all = "/nix/persist/nix-dotfiles/nixos-update-manager.sh gc";
    };
  };
  programs.starship.enable = true;
}
