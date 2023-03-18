{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      autoLogin = {
        enable = true;
        user = "raab";
      };
    };
    desktopManager.gnome.enable = true;
  };
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    epiphany # web browser
    geary # email reader
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    yelp # Help view
    gnome-contacts
    gnome-initial-setup
    seahorse # keyring
    libgnome-keyring # keyring
    gnome-keyring # keyring
  ]);
  services.gnome.gnome-keyring.enable = lib.mkForce false;
  programs.dconf.enable = true;
}