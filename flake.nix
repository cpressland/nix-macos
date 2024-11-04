{
  description = "macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      programs.fish.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;
    };
    configurationMac = { pkgs, ... }: {
      users.users.cpressland.home = "/Users/cpressland";
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
    configurationLinux = { pkgs, ... }: {
      users.users.cpressland.home = "/home/cpressland";
      nixpkgs.hostPlatform = "x86_64-linux";
    };
  in
  {
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        configurationMac
        (import ./hosts/macbook/config.nix)
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "cpressland";
          };
        }
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cpressland = import ./home-manager/macos.nix;
        }
      ];
    };
    darwinPackagesMacBook = self.darwinConfigurations."macbook".pkgs;
    darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        configurationMac
        (import ./hosts/mini/config.nix)
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "cpressland";
          };
        }
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cpressland = import ./home-manager/macos.nix;
        }
      ];
    };
    darwinPackagesMini = self.darwinConfigurations."mini".pkgs;
  };
  nixosConfigurations."wsl" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      configuration
      configurationLinux
      (import ./hosts/wsl/config.nix)
      nix-homebrew.nixosModules.nix-homebrew {
        nix-homebrew = {
          enable = true;
          user = "cpressland";
        };
      }
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.cpressland = import ./home-manager/wsl.nix;
      }
    ];
  };
}
