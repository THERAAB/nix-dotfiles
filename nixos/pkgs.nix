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
    exa
    fzf
    grc
    bat
    ripgrep
    tealdeer
    procs
    du-dust
    fd
    bottom
  ];
}
