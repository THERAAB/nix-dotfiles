{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.gnome-power-manager
  ];
}
