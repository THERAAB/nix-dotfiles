{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    killall
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
    gnome-text-editor
    gnome.nautilus
    bat
    ripgrep
    tealdeer
    procs
    du-dust
    bottom
    helix
    kitty
    gnome.ghex
    pavucontrol
    xorg.xlsclients
    nil
    neovim
    alejandra
    wl-clipboard
    acpica-tools
    gparted
    acpi
    vim
    hw-probe
    google-chrome
    nvme-cli
    s0ix-selftest-tool
    stress
    libva-utils
    sysfsutils
  ];
}
