{...}: {
  imports = [
    ../../../share/nixos
    ./hardware.nix
    ./hardware-configuration.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
