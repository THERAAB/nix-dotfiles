{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    headsetcontrol
    protonup
    polychromatic
    snapper-gui
    jetbrains.idea-community
  ];
}
