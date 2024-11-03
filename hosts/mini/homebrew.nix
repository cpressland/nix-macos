{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    taps = [];
    brews = [
      "bash"
      "watch"
      "yt-dlp"
    ];
    casks = [
      "1password"
      "1password-cli"
      "firefox"
      "wezterm"
      "visual-studio-code"
      "plex-media-server"
      "docker"
    ];
    masApps = {
      "Tailscale" = 1475387142;
      "Wireguard" = 1451685025;
      "Amphetamine" = 937984704;
    };
  };
}
