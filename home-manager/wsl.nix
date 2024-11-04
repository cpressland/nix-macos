{ pkgs, ... }: {
  home.username = "cpressland";
  home.homeDirectory = "/home/cpressland";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  home.file = {
    ".config/nix".source = ../dotfiles/nix;
    ".config/starship.toml".source = ../dotfiles/starship/starship.toml;
    ".config/fish".source = ../dotfiles/fish;
    ".gitconfig".source = ../dotfiles/git/wsl2/gitconfig;
    ".ssh/config".source = ../dotfiles/ssh/config;
  };
}
