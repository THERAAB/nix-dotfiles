{...}: {
  boot = {
    loader.grub.extraConfig = ''
      acpi /ssdt-csc3551.aml
      if keystatus --shift ; then
        set timeout=-1
      else
        set timeout=0
      fi
    '';
    # Power Management stuff
    kernel.sysctl = {
      "vm.dirty_writeback_centisecs" = 6000;
      "vm.laptop_mode" = 5;
    };
  };
}
