{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    gnome-text-editor
    gnome.nautilus
    killall
    openrazer-daemon
    microcodeAmd
    pulseaudio # needed to use pactl on pipewire
    efibootmgr
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
  ];
}
