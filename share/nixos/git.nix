{...}: {
  programs.git = {
    enable = true;
    config = {
      push.autoSetupRemote = true;
      safe.directory = "*";
    };
  };
}
