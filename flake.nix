{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config.allowUnfree = true;

      systems.modules.nixos = with inputs; [
        impermanence.nixosModules.impermanence
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
      ];

      homes.users."raab@nix-desktop".modules = with inputs; [
        impermanence.nixosModules.home-manager.impermanence
      ];
      homes.users."raab@nix-zenbook".modules = with inputs; [
        impermanence.nixosModules.home-manager.impermanence
      ];

      snowfall = {
        namespace = "nix-dotfiles";
      };
    };
}
