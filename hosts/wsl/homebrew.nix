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
      "bash"
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
  };
}
