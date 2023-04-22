{
  description = "nix-dotfiles flake";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager/master;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = github:nix-community/impermanence;
    sops-nix = {
      url = github:Mic92/sops-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = github:pta2002/nixvim;
    hyprland.url = "github:hyprwm/Hyprland";
  };
  
  outputs = { self, nixpkgs, home-manager, impermanence, sops-nix, hyprland, ... }@inputs:
   let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./lib/pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );
      # Your custom packages and modifications, exported as overlays
      overlays = import ./lib/overlays;
      nixosConfigurations = {
        nix-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            impermanence.nixosModules.impermanence
#            hyprland.nixosModules.default
            ./nixos
            sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs self;
              };
              home-manager.users.raab = { pkgs, ... }: {
                imports = [
                  impermanence.nixosModules.home-manager.impermanence
#                  hyprland.homeManagerModules.default
                  ./home
                  inputs.nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
    };
}