{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    killall
    microcodeAmd
    pulseaudio # needed to use pactl on pipewire
    htop
    dmidecode
    parted
    pciutils # for lspci
    wget
    unzip
    usbutils
    age
    sops
    ssh-to-age
    libnotify
    wmctrl
  ];
}
