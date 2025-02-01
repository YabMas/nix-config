{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    curl
    less
    # nodejs_20
    # yarn: issue - https://github.com/NixOS/nixpkgs/issues/145634
    cargo
    # clojure
    # babashka
#    keybase
    terraform
    gh
    # fnm
    tmux
    tmuxinator
    # gnupg
    jq
  ];
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };
  home.sessionPath = [ "$HOME/.local/bin" ];
  programs = {
  	bat = {
  		enable = true;
  		config.theme = "TwoDark";
	};
  	fzf = {
  		enable = true;
  		enableZshIntegration = true;
	};
  exa.enable = true;
  git.enable = true;
  direnv.enable = true;
  java = {
    enable = false;
    # package = pkgs.jdk17;
      # package = pkgs.jdk11;
#    package = pkgs.jdk8;
  };
  zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtra = "
    source /Users/yabmas/SystemConfig/modules/home-manager/dotfiles/.zshrc
    ";
shellAliases = {
  ls = "ls --color=auto -F";
  nixswitch = "darwin-rebuild switch --flake ~/SystemConfig";
  nixup = "pushd ~/src/system-config; nix flake update; nixswitch; popd";
};
oh-my-zsh = {
      enable = true;
      plugins = [
      "git"
      "autojump"
      ];
      theme = "agnoster";
};
  };
  };

  home.file.".inputrc".source = ./dotfiles/inputrc;
}
