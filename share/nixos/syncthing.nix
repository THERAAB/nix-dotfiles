{...}: {
  services.syncthing = {
    enable = true;
    relay.enable = false;
    openDefaultPorts = true;
    overrideDevices = false;
    overrideFolders = false;
    settings = {
      options.urAccepted = -1;
      devices = {
        nix-server = {
          id = "W33BOU2-KH5UGR6-MLWF3FP-EO4D4MT-QJZHZ44-XGSW54C-JXWMZFB-W5DKMQU";
          addresses = ["tcp://192.168.3.2:22000" "tcp://100.121.108.123:22000"];
          introducer = true;
          autoAcceptFolders = true;
        };
      };
      "/dropbox" = {
        id = "default";
        versioning = {
          type = "staggered";
          params.maxAge = "7776000"; # 90 days
        };
      };
    };
  };
}
