{ config, pkgs, lib, home-manager, ... }:

let
  user = "josspemsel";
  # Define the content of your file as a derivation
  myEmacsLauncher = pkgs.writeScript "emacs-launcher.command" ''
    #!/bin/sh
    emacsclient -c -n &
  '';
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = {
#      "1password" = 1333542190;
#      "wireguard" = 1451685025;
      "Xcode" = 497799835;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
          { "emacs-launcher.command".source = myEmacsLauncher; }
        ];
        stateVersion = "23.11";
      };
      programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Slack.app/"; }
    { path = "/Applications/Whatsapp.app/"; }
    { path = "/Users/josspemsel/Applications/Home Manager Apps/Warp.app"; }
    { path = "/Applications/Nix Apps/Alacritty.app/"; }
    { path = "/Applications/Firefox.app/"; }
    { path = "/Applications/Safari.app"; }
    { path = "/Applications/Google Chrome.app"; }
    { path = "/Applications/Visual Studio Code.app"; }
    { path = "/Applications/Obsidian.app"; }
    { path = "/Applications/Steam.app"; }
    { path = "/Applications/DiffusionBee.app"; }
    { path = "/Applications/Bitwarden.app"; }
  ];

}
