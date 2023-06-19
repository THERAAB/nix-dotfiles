{...}: {
  networking.hostName = "nix-desktop"; # Define your hostname.

  services.snapper = {
    snapshotInterval = "*:0/20";
    cleanupInterval = "2h";
    configs = {
      "persist" = {
        SUBVOLUME = "/nix/persist";
        ALLOW_USERS = ["raab"];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_MIN_AGE = 7200; # 2 hours
        TIMELINE_LIMIT_HOURLY = 10;
        TIMELINE_LIMIT_DAILY = 10;
        TIMELINE_LIMIT_WEEKLY = 4;
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };
  hardware.openrazer = {
    enable = true;
    users = ["raab"];
  };
  # headsetcontrol udev rules
  services.udev.extraRules = "ACTION!=\"add|change\", GOTO=\"headset_end\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a5c\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a89\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a5b\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a87\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0ab5\", TAG+=\"uaccess\"\n LABEL=\"headset_end\"";
}
