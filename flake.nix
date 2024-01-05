{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = "https://petar-kirov-dotfiles.cachix.org";
    extra-trusted-public-keys = "petar-kirov-dotfiles.cachix.org-1:WW4VsSGibdlNBDpqSsVhjVpz5/FZBX8uS0+yLdFEYP0=";
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-23.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils-plus = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
      inputs.flake-utils.follows = "flake-utils";
    };

    nixd = {
      url = "github:nix-community/nixd";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server = {
      url = "github:nix-community/nixos-vscode-server?rev=7e581626a07486b1779ef02320e7e310feb11611";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    cachix-deploy = {
      url = "github:cachix/cachix-deploy-flake";
    };
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixpkgs-unstable,
    nix-on-droid,
    flake-parts,
    cachix-deploy,
    ...
  } @ inputs: let
    defaultUser = "martin";
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
      _module.args = {inherit defaultUser;};
      imports = [
        ./nixos/machines
        ./nixos/nix-on-droid
      ];
      perSystem = {
        self,
        pkgs,
        unstablePkgs,
        system,
        inputs',
        lib,
        ...
      }: let
        cachix-deploy-lib = cachix-deploy.lib pkgs;

        makeHomeConfig = modules: username:
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs modules;
            extraSpecialArgs = {inherit username unstablePkgs inputs' inputs;};
          };
      in {
        _module.args = {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          unstablePkgs = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        devShells.default = import ./shell.nix {inherit pkgs;};
        legacyPackages.x86_64-linux.homeConfigurations = rec {
          bareMetalMachines =
            lib.pipe self.nixosConfigurations
            [
              (builtins.mapAttrs (name: sys: sys.config.system.build.toplevel))
              (lib.filterAttrs (name: sys: !(lib.hasSuffix "-vm" name)))
            ];

          virtualMachines =
            lib.pipe self.nixosConfigurations
            [
              (builtins.mapAttrs (name: sys: sys.config.virtualisation.vmVariant.system.build.toplevel))
              (lib.filterAttrs (name: sys: lib.hasSuffix "-vm" name))
            ];

          ${defaultUser} = home-config-full;
          home-config-base = makeHomeConfig [./nixos/home/base] defaultUser;
          home-config-full = makeHomeConfig [./nixos/home/full] defaultUser;
          home-config-macos = makeHomeConfig [./nixos/home/macos] "pkirov";
        };
        packages = {
          cachix-deploy-bare-metal-spec = cachix-deploy-lib.spec {
            agents = self.legacyPackages.x86_64-linux.bareMetalMachines;
          };

          cachix-deploy-vm-spec = cachix-deploy-lib.spec {
            agents = self.legacyPackages.x86_64-linux.virtualMachines;
          };
        };
      };
    };
}
