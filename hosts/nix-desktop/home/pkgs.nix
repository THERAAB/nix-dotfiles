{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    headsetcontrol
    protonup
    razergenie
    snapper-gui
    jetbrains.idea-community
  ];
}
