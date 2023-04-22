{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Standard-Blue-Dark";
       package = pkgs.catppuccin-gtk;
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
    gtk3.extraConfig.gtk-application-prefer-dark-theme=1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme=1;
  };
  home.sessionVariables.GTK_THEME = "Catppuccin-Frappe-Standard-Blue-Dark";

  home.packages = with pkgs; [
    catppuccin-gtk
  ];
}