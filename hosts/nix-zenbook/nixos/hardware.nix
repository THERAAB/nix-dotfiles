{...}: {
  hardware = {
    cpu.intel.updateMicrocode = true;
    bluetooth.settings = {
      General = {
        Experimental = true;
      };
    };
  };
  networking.hostName = "nix-zenbook";
  powerManagement = {
    enable = true;
    scsiLinkPolicy = "med_power_with_dipm";
  };
  services.thermald.enable = true;
}
