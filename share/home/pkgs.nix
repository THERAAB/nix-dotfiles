{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.idea-community
    gimp
    vmware-horizon-client
    discord
    imagemagick
    libreoffice-fresh
    psutils
    unzip
    zoom-us
    glibc
    file
    ncdu_2
    tree
    strace
    ventoy-full
    lm_sensors
  ];
}
