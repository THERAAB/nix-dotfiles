{...}: {
  imports = [
    ./sops.nix
    ./persist.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
