# nix-macos

Nix Configuration for macOS

Steps:
1. Clone the project: `$ https://github.com/cpressland/nix-macos.git`
2. Install nix: `$ sh <(curl -L https://nixos.org/nix/install)`
3. Install nix-darwin: `$ nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer ./result/bin/darwin-installer`
4. Run the project: `$ darwin-rebuild switch --flake ~/dev/nix-macos#macbook` or `darwin-rebuild switch --flake ~/dev/nix-macos#mini`
