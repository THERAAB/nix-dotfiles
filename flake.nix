{
  description = "nix-dotfiles flake";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    impermanence,
    sops-nix,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    # Your custom packages
    # Acessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./share/lib/pkgs {inherit pkgs;}
    );
    # Devshell for bootstrapping
    # Acessible through 'nix develop' or 'nix-shell' (legacy)
    devShells = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./share/shell.nix {inherit pkgs;}
    );
    # Your custom packages and modifications, exported as overlays
    overlays = import ./share/lib/overlays;
    nixosConfigurations = {
      nix-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs nixpkgs-unstable;};
        modules = [
          impermanence.nixosModules.impermanence
          ./share/nixos
          ./hosts/nix-desktop/nixos
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs self;
              };
              users.raab = {pkgs, ...}: {
                imports = [
                  impermanence.nixosModules.home-manager.impermanence
                  ./share/home
                  ./hosts/nix-desktop/home
                ];
              };
            };
          }
        ];
      };
      nix-zenbook = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs nixpkgs-unstable;};
        modules = [
          impermanence.nixosModules.impermanence
          ./share/nixos
          ./hosts/nix-zenbook/nixos
          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs self;
              };
              users.raab = {pkgs, ...}: {
                imports = [
                  impermanence.nixosModules.home-manager.impermanence
                  ./share/home
                  ./hosts/nix-zenbook/home
                ];
              };
            };
          }
        ];
      };
    };
  };
}
