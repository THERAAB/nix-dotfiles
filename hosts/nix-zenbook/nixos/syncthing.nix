{...}: {
  services.syncthing = {
    enable = true;
    user = "raab";
    configDir = "/nix/persist/home/raab/.config/syncthing";
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    devices = {
      nix-server.id = "W33BOU2-KH5UGR6-MLWF3FP-EO4D4MT-QJZHZ44-XGSW54C-JXWMZFB-W5DKMQU";
    };
    folders = {
      Share = {
        path = "/home/raab/Documents";
        devices = ["nix-server"];
      };
    };
  };
}
