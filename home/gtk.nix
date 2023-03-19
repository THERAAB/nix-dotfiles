{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "NotoSans Nerd Font";
    };
    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 40;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "Juno";
}