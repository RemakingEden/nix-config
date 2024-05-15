{ pkgs }:

with pkgs; [
  # General packages for development and system management
  act
  alacritty
  aspell
  aspellDicts.en
  bash-completion
  bat

#  btop
  coreutils
  killall
  neofetch
  openssh
  pandoc
  sqlite
  wget
  zip

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2
  #pinentry
  yubikey-manager
  _7zz

  # Cloud-related tools and SDKs
  docker
  docker-compose
  docker-credential-helpers
  colima
  kool

  awscli2
  flyctl
  ngrok
  tflint

  # Media-related packages
  emacs-all-the-icons-fonts
  dejavu_fonts
  ffmpeg
  fd
  font-awesome
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf

  # Node.js development tools
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  fnm
  watchman

  # PHP development tools
  php
  php82Packages.composer
  phpunit

  # DB development tools
  mysql80

  # Text and terminal utilities
  htop
  hunspell
  iftop
  jetbrains-mono
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip
  zsh-powerlevel10k

  # Python packages
  python39
  python39Packages.virtualenv # globally install virtualenv

  # Java packages
  jdk17

  ## Security Tools
  #trufflehog
]
