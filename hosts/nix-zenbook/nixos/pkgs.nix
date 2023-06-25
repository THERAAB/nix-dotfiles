{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnome.gnome-power-manager
  ];
}
