{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      configurationLimit = 10;
      gfxmodeEfi = "text";
      splashImage = null;
      extraConfig = ''
        if keystatus --shift ; then
          set timeout=-1
        else
          set timeout=0
        fi
      '';
    };
  };
}