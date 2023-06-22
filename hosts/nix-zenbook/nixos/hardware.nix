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
  #powerManagement = {
  #  enable = true;
  #  powertop.enable = true;
  #};
  services.thermald.enable = true;
}
