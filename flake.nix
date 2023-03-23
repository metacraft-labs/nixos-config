{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = "https://petar-kirov-dotfiles.cachix.org";
    extra-trusted-public-keys = "petar-kirov-dotfiles.cachix.org-1:WW4VsSGibdlNBDpqSsVhjVpz5/FZBX8uS0+yLdFEYP0=";
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:t184256/nix-on-droid";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    omf-bobthefish.url = "github:oh-my-fish/theme-bobthefish";
    omf-bobthefish.flake = false;

    # nixos-modules.url = "git+file:///home/monyarm/code/repos/nixos-modules";
    nixos-modules.url = "github:metacraft-labs/nixos-modules/sccache";
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixpkgs-unstable,
    nix-on-droid,
    omf-bobthefish,
    nixos-modules,
    ...
  }: let
    system = "x86_64-linux";
    defaultUser = "monyarm";
    users = [defaultUser];

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    unstablePkgs = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    machines = builtins.attrNames (
      nixpkgs.lib.filterAttrs
      (n: v: v == "directory")
      (builtins.readDir ./nixos/machines)
    );

    makeMachineConfig = defaultUser: hostname:
      nixpkgs.lib.nixosSystem {
        inherit pkgs system;
        modules = [
          ./nixos/machines/import-machine.nix
          nixos-modules.lib.sccache
          {
            service.sccache.enable = true;
            service.sccache.scheduler = false;
            service.sccache.client = true;
            service.sccache.server = true;
            service.sccache.token = "TOKEN";
            service.sccache.sched_url = "http://192.168.1.121:10600";
            service.sccache.sched_addr = "192.168.1.121:10600";
            service.sccache.server_addr = "192.168.1.109:10501";
          }
        ];
        specialArgs = {inherit defaultUser hostname unstablePkgs;};
      };

    makeHomeConfig = username:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nixos/home/full
        ];
        extraSpecialArgs = {
          inherit username unstablePkgs omf-bobthefish;
        };
      };

    makeNixOnDroidConfig = username:
      nix-on-droid.lib.nixOnDroidConfiguration {
        config = ./nix-on-droid.nix;
        system = "aarch64-linux";
        extraModules = [
          # import source out-of-tree modules like:
          # flake.nixOnDroidModules.module
        ];
        extraSpecialArgs = {
          # arguments to be available in every nix-on-droid module
        };
        # your own pkgs instance (see nix-on-droid.overlay for useful additions)
        # pkgs = ...;
      };
  in {
    nixosConfigurations = pkgs.lib.genAttrs machines (makeMachineConfig defaultUser);
    homeConfigurations = pkgs.lib.genAttrs users makeHomeConfig;
    nixOnDroidConfigurations = {device = makeNixOnDroidConfig defaultUser;};
    devShells."${system}".default = import ./shell.nix {inherit pkgs;};
  };
}
