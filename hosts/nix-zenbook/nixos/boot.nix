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
  };
}
