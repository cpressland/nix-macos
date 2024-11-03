{
  description = "macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    dots.url = "github:cpressland/dots";
  };

  outputs = inputs@{ self, dots, nixpkgs, nix-darwin, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      services.nix-daemon.enable = true;
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      programs.fish.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.cpressland.home = "/Users/cpressland";
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;
    };
    homeconfig = { pkgs, dots, ... }: {
      home.username = "cpressland";
      home.homeDirectory = "/Users/cpressland";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
      home.file = {
        ".config/nix".source = "${inputs.dots}/nix";
        ".config/wezterm".source = "${inputs.dots}/wezterm";
        ".config/starship.toml".source = "${inputs.dots}/starship/starship.toml";
        ".config/fish".source = "${inputs.dots}/fish";
        ".gitconfig".source = "${inputs.dots}/git/macos/gitconfig";
        ".ssh/config".source = "${inputs.dots}/ssh/config";
      };
    };
  in
  {
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
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
          home-manager.users.cpressland = homeconfig;
        }
      ];
    };
    darwinPackagesMacBook = self.darwinConfigurations."macbook".pkgs;
    darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
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
          home-manager.users.cpressland = homeconfig;
        }
      ];
    };
    darwinPackagesMini = self.darwinConfigurations."mini".pkgs;
  };
}
