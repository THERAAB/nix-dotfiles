{...}: {
  hardware = {
    cpu.intel.updateMicrocode = true;
    bluetooth.settings = {
      General = {
        Experimental = true;
      };
    };
  };
  networking.hostName = "nix-zenbook";
  powerManagement = {
    enable = true;
    scsiLinkPolicy = "med_power_with_dipm";
    powertop.enable = true;
  };
  services = {
    thermald.enable = true;
    logind.lidSwitch = "suspend-then-hibernate";
    # Disable ELAN Fingerprint reader
    udev.extraRules = ''ATTRS{idVendor}=="04f3", ATTRS{idProduct}=="0c6e", SUBSYSTEM=="usb", ATTR{authorized}="0"'';
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=8h";
}
