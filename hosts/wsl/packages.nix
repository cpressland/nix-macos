{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.fish
    pkgs.zsh
    pkgs.starship
    pkgs.atuin
    pkgs.tmux
    pkgs.neovim
    pkgs.curl
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
}
