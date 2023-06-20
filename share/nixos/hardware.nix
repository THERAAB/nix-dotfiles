{pkgs, ...}: {
  services.fstrim.enable = true;
  services.irqbalance.enable = true;
  services.fwupd.enable = true;
  services.smartd.enable = true;

  networking.networkmanager.enable = true;
  services.tailscale.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.utf8";

  services.avahi = {
    enable = true;
    nssmdns = true;
  };
  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };
}
