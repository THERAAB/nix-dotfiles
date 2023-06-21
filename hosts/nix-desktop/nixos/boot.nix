{...}: {
  boot = {
    loader.grub.extraConfig = ''
      if keystatus --shift ; then
        set timeout=-1
      else
        set timeout=0
      fi
    '';
  };
}
