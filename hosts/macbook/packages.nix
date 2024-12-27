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
    # pkgs.magic-wormhole // tests are currently failing.
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
    pkgs.ffmpeg
  ];
  fonts.packages = [
    pkgs.cascadia-code
    pkgs.nerd-fonts.caskaydia-cove
  ];
}
