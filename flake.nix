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
      environment.systemPackages = [
        pkgs.fish
        pkgs.zsh
        pkgs.starship
        pkgs.atuin
        pkgs.tmux
        pkgs.neovim
        pkgs.vim
        pkgs.git
        pkgs.eza
        pkgs.bat
        pkgs.fluxcd
        pkgs.kubectl
        pkgs.kubelogin
        pkgs.kubernetes-helm
        pkgs.opentofu
        pkgs.jq
        pkgs.uv
        pkgs.just
        pkgs.ripgrep
        pkgs.kustomize
        pkgs.magic-wormhole
        pkgs.mosquitto
        pkgs.openssl
        pkgs.rclone
        pkgs.redis
        pkgs.rsync
        pkgs.tree
        pkgs.trivy
        pkgs.wget
        pkgs.wireguard-tools
        pkgs.yubikey-manager
        pkgs.zstd
      ];
      fonts.packages = [
        pkgs.cascadia-code
        (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })
	    ];

      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };
        taps = ["hashicorp/tap"];
        brews = [
          "hashicorp/tap/terraform"
          "azure-cli"
          "bash"
          "mas"
          "poetry"
          "pipenv"
          "pipx"
          "go"
          "node"
          "python@3.13"
          "python@3.12"
          "python@3.11"
          "python@3.10"
          "python@3.9"
          "postgresql@15"
          "postgresql@16"
          "rust"
          "watch"
          "yarn"
          "yt-dlp"
        ];
        casks = [
          "1password"
          "1password-cli"
          "steam"
          "firefox"
          "wezterm"
          "visual-studio-code"
        ];
        masApps = {
          "Tailscale" = 1475387142;
          "Wireguard" = 1451685025;
          "Slack" = 803453959;
        };
      };

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
    darwinPackages = self.darwinConfigurations."macbook".pkgs;
  };
}
