{ ... }: {
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
      "awscli"
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
      "docker"
      "iina"
      "telegram"
    ];
    masApps = {
      "Tailscale" = 1475387142;
      "Wireguard" = 1451685025;
      "Slack" = 803453959;
      "Amphetamine" = 937984704;
    };
  };
}
