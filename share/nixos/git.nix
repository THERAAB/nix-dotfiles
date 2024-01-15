{...}: {
  programs.git = {
    enable = true;
    push.autoSetupRemote = true;
    safe.directory = "*";
  };
}
