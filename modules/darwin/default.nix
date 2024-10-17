{ pkgs, ... }: {
  users.users.jaamaask.home = "/Users/jaamaask";
  users.users.yabmaz.home = "/Users/yabmaz";
  # here go the darwin preferences and config items
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ];
  services.nix-daemon.enable = true;
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
  # backwards compat; don't change
  system.stateVersion = 4;
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    masApps = { };
    taps = [
    "borkdude/brew"
    "spacelift-io/spacelift"
    ];
    brews = [
    "nvim"
    "node@20"
    "yarn"
    "borkdude/brew/babashka"
    "borkdude/brew/clj-kondo"
    "borkdude/brew/jet"
    "autojump"
    "gpg2"
    "gnupg"
    "pinentry-mac"
    "fnm"
    "clojure"
    "python-setuptools" # https://stackoverflow.com/questions/69919970/no-module-named-distutils-but-distutils-installed
    "graphviz"
    "syncthing"
    "ripgrep"
    "fd"
    "luarocks"
    "mkcert"
    "gettext"
    "wget"
    "neovim-remote"
    "lazygit"
    "spacelift-io/spacelift/spacectl"
    ];
    casks =
    [
    "slack"
    "obsidian"
    "wezterm"
#    "gpg-suite"
    "spotify"
#    "raycast"
    "amethyst"
#    "keybase" -- had to install from website
    "cljstyle"
    "neovide"
    "nikitabobko/tap/aerospace"
    "docker"
    "caffeine"
    "google-drive"
    ];
  };
}
