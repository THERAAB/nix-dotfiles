{...}: {
  hardware.cpu.intel.updateMicrocode = true;
  networking.hostName = "nix-zenbook";
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.thermald.enable = true;
}
