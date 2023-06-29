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
    scsiLinkPolicy = "med_power_with_dipm";
    powertop.enable = true;
    powerUpCommands = ''
      echo 80 > /sys/class/power_supply/BAT?/charge_control_end_threshold
    '';
  };
  services = {
    thermald.enable = true;
    logind.lidSwitch = "suspend-then-hibernate";
    # Disable ELAN Fingerprint reader
    udev.extraRules = ''ATTRS{idVendor}=="04f3", ATTRS{idProduct}=="0c6e", SUBSYSTEM=="usb", ATTR{authorized}="0"'';
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=8h
    HibernateMode=shutdown
  '';
  systemd.services.battery-charge-threshold = {
    wantedBy = ["local-fs.target" "suspend.target"];
    after = ["local-fs.target" "suspend.target"];
    description = "Set the battery charge threshold%";
    startLimitBurst = 5;
    startLimitIntervalSec = 1;
    serviceConfig = {
      Type = "oneshot";
      Restart = "on-failure";
      ExecStart = "${pkgs.runtimeShell} -c 'echo 80 > /sys/class/power_supply/BAT?/charge_control_end_threshold'";
    };
  };
}
