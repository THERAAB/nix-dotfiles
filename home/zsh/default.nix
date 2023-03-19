{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      update-channels = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_channel";
      update-flake = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_flake";
      update-full-with-git = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_full";
      update-git-dotfiles = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_dotfiles_git";
      garbage-collect-all = "/nix/persist/nix-dotfiles/nixos-update-manager.sh gc";
    };
    oh-my-zsh = {
      enable = true;
      custom = "$HOME/.oh-my-zsh/";
      plugins = [ 
        "git"
  	    "sudo"
      ];
      theme = "bubble-custom";
    };
    initExtra = '' export EDITOR="nvim" '';
  };
  
  home.file.".oh-my-zsh/themes/bubble-custom.zsh-theme" = {
    source = ./bubble-custom.zsh-theme;
  };
}
