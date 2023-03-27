{ config, pkgs, ... }:
{  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
#    initrd.verbose = false;
#    plymouth.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
#      configurationLimit = 10;
      gfxmodeEfi = "text";
      splashImage = null;
#      extraConfig = ''
#        if keystatus --shift ; then
#          set timeout=-1
#        else
#          set timeout=0
#        fi
#      '';
    };
#    kernelParams = [ "quiet" "splash" "rd.systemd.show_status=false" "udev.log_priority=3" "boot.shell_on_fail" ];
#    consoleLogLevel = 0;
  };
}
