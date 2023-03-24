{ config, pkgs, ... }:
{    
  services.fstrim.enable = true;
  services.irqbalance.enable = true;
  services.fwupd.enable = true;
  services.smartd.enable = true;
  
  services.snapper = {
    snapshotInterval = "*:0/20";
    cleanupInterval = "2h";
    configs = {
      "persist" = {
        subvolume = "/nix/persist";
        extraConfig = ''
          ALLOW_USERS="raab"
          TIMELINE_CREATE=yes
          TIMELINE_CLEANUP=yes
          TIMELINE_MIN_AGE="7200" # 2 hours
          TIMELINE_LIMIT_HOURLY="10"
          TIMELINE_LIMIT_DAILY="10"
          TIMELINE_LIMIT_WEEKLY="4"
          TIMELINE_LIMIT_MONTHLY="0"
          TIMELINE_LIMIT_YEARLY="0"
        '';
      };
    };
  };

  networking.hostName = "nix-desktop"; # Define your hostname.
  networking.networkmanager.enable = true;

  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  services.avahi = {
    enable = true;
    nssmdns = true;
  };
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    config.pipewire = { 
      context.properties = { 
        default.clock.allowed-rates = [ 44100 48000 88200 96000 ];
      };
    };
  };

  hardware.bluetooth.enable = true;
  hardware.openrazer = {
    enable = true;
    users = [ "raab" ];
  };
  
  # headsetcontrol udev rules
  services.udev.extraRules = "ACTION!=\"add|change\", GOTO=\"headset_end\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a5c\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a89\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a5b\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0a87\", TAG+=\"uaccess\"\n KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"046d\", ATTRS{idProduct}==\"0ab5\", TAG+=\"uaccess\"\n LABEL=\"headset_end\"";
}
