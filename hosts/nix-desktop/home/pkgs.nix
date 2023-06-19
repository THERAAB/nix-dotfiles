{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.idea-community
    heroic
    gimp
    headsetcontrol
    vmware-horizon-client
    discord
    imagemagick
    libreoffice-fresh
    psutils
    unzip
    protonup
    razergenie
    zoom-us
    glibc
    file
    ncdu_2
    tree
    strace
    snapper-gui
    ventoy-full
    lm_sensors
  ];
}
