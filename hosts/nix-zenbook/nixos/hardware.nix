{...}: {
  hardware.cpu.intel.updateMicrocode = true;
  networking.hostName = "nix-zenbook";
  powerManagement.powertop.enable = true;
}
