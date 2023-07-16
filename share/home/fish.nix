{...}: {
  programs = {
    fish = {
      enable = true;
      shellAliases = {
        update-channels = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_channel";
        update-flake = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_flake";
        update-full-with-git = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_full";
        update-git-dotfiles = "/nix/persist/nix-dotfiles/nixos-update-manager.sh update_dotfiles_git";
        garbage-collect-all = "/nix/persist/nix-dotfiles/nixos-update-manager.sh gc";
        cat = "bat --theme=base16-256";
        grep = "rg";
        ps = "procs";
        du = "dust";
        htop = "btm";
      };
    };
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    atuin.enable = true;
    exa = {
      enable = true;
      enableAliases = true;
    };
  };
}
