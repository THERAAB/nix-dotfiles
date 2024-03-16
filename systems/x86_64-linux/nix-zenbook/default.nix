{...}: {
  imports = [
    ../../../share/nixos
    ./autologin.nix
    ./boot.nix
    ./hardware.nix
    ./pkgs.nix
    ./hardware-configuration.nix
  ];
  nix-dotfiles.workstation.enable = true;
}
