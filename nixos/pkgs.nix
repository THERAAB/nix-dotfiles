{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    killall
    microcodeAmd
    pulseaudio # needed to use pactl on pipewire
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
    neovim
    gnome-text-editor
    gnome.nautilus
    exaq
    bat
    ripgrep
    tealdeer
    procs
    du-dust
    bottom
    zoxide
    helix
    foot
    gnome.ghex
  ];
}
