{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = ["quiet" "splash" "rd.systemd.show_status=false" "udev.log_priority=3" "boot.shell_on_fail"];
    loader.grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      configurationLimit = 10;
      gfxmodeEfi = "text";
      splashImage = null;
    };
  };
}
