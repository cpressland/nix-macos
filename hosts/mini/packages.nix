{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.fish
    pkgs.zsh
    pkgs.starship
    pkgs.atuin
    pkgs.tmux
    pkgs.curl
    pkgs.neovim
    pkgs.vim
    pkgs.git
    pkgs.eza
    pkgs.bat
    pkgs.jq
    pkgs.uv
    pkgs.just
    pkgs.ripgrep
    pkgs.kustomize
    pkgs.magic-wormhole
    pkgs.mosquitto
    pkgs.rclone
    pkgs.rsync
    pkgs.tree
    pkgs.wget
    pkgs.wireguard-tools
    pkgs.zstd
  ];
  fonts.packages = [
    pkgs.cascadia-code
    (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })
  ];
}
