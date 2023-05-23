{...}: {
  programs = {
    fish.enable = true;
    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
    atuin.enable = true;
  };
}
