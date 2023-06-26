{...}: {
  boot = {
    loader.grub.extraConfig = ''
      acpi /ssdt-csc3551.aml
      set timeout=1
    '';
    # Power Management stuff
    kernel.sysctl = {
      "vm.dirty_writeback_centisecs" = 6000;
      "vm.laptop_mode" = 5;
    };
    kernelParams = [
      "kernel.nmi_watchdog=0"
      "nvme.noacpi=1"
      "acpi.no_ec_wakeup=1"
      "resume_offset=6776306"
    ];
    extraModprobeConfig = ''
      options iwlwifi power_save=1
      options iwlwifi uapsd_disable=0
      options iwlmvm power_scheme=3
      options snd_hda_intel power_save=1
      options i915 enable_guc=3
    '';
    resumeDevice = "/dev/disk/by-label/nixos";
  };
}
