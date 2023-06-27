{pkgs, ...}: {
  hardware = {
    cpu.intel.updateMicrocode = true;
    bluetooth.settings = {
      General = {
        Experimental = true;
      };
    };
    # Intel hardware acceleration
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # LIBVA_DRIVER_NAME=iHD
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
  networking.hostName = "nix-zenbook";
  powerManagement = {
    enable = true;
  };
  services = {
    thermald.enable = true;
    logind.lidSwitch = "suspend-then-hibernate";
    power-profiles-daemon.enable = false;
    tlp.enable = true;
    # Disable ELAN Fingerprint reader
    udev.extraRules = ''ATTRS{idVendor}=="04f3", ATTRS{idProduct}=="0c6e", SUBSYSTEM=="usb", ATTR{authorized}="0"'';
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=4h";
}
