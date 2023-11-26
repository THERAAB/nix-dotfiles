{...}: {
  services.syncthing = {
    enable = true;
    relay.enable = false;
    user = "raab";
    configDir = "/nix/persist/home/raab/.config/syncthing";
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    devices = {
      nix-server = {
        id = "F2373FD-HW5QAKL-NEXKV73-QFMLFZF-47SKVYQ-HHDCO6S-XOYOGTS-6PSKIAP";
        addresses = ["tcp://192.168.3.2:22000" "tcp://100.121.108.123:22000"];
      };
    };
    folders = {
      Share2 = {
        path = "/home/raab/Documents";
        devices = ["nix-server"];
      };
    };
  };
}
