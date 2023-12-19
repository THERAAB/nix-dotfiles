{pkgs, ...}: {
  home.packages = with pkgs; [
    heroic
    protonup
    polychromatic
    snapper-gui
    jetbrains.idea-community
  ];
}
