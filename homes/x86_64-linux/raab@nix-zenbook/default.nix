{pkgs, ...}: {
  imports = [
    ./gnome.nix
    ./wall.nix
  ];
  nix-dotfiles = {
    workstation.enable = true;
    programs.libinput-gestures.enable = true;
  };
  home.packages = with pkgs; [
    powertop
  ];
}
