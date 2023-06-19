{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    microcodeAmd
  ];
}
