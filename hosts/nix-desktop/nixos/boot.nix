{...}: {
  boot = {
    initrd.verbose = false;
    kernelParams = ["quiet" "splash" "rd.systemd.show_status=false" "udev.log_priority=3" "boot.shell_on_fail"];
    consoleLogLevel = 0;
    loader.grub.extraConfig = ''
      if keystatus --shift ; then
        set timeout=-1
      else
        set timeout=0
      fi
    '';
  };
}
