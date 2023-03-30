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
    base16 = {
      url = github:SenchoPens/base16.nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16-schemes = {
      url = github:base16-project/base16-schemes;
      flake = false;
    };
    base16-vim = {
      url = github:base16-project/base16-vim;
      flake = false;
    };
    vim-base16-lightline = {
      url = github:daviesjamie/vim-base16-lightline;
      flake = false;
    };
    nixvim.url = github:pta2002/nixvim;
  };
  
  outputs = { self, nixpkgs, home-manager, impermanence, sops-nix, base16, ... }@inputs:
   let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      theme = "everforest";
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
            base16.nixosModule
            { scheme = "${inputs.base16-schemes}/${theme}.yaml"; }
            impermanence.nixosModules.impermanence
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
                  base16.homeManagerModule
                  { scheme = "${inputs.base16-schemes}/${theme}.yaml"; }
                  impermanence.nixosModules.home-manager.impermanence
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