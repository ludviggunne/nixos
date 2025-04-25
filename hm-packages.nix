{
  pkgs,
}:

(with pkgs; [ # nixpkgs
  helix
  alacritty
  qutebrowser
  curl
  wget
  git
  pass
  evince
  tmux
  libreoffice
  # zsh
  cryptsetup
  gnupg
  pinentry
  ardour
  surge-XT
  man-pages
  man-pages-posix
  stdmanpages
  sxiv
  watchexec
  pavucontrol
  spotify-qt
  spotifyd
  prismlauncher
  strawberry
  blender
  moreutils
  vlc
  termdown
  hub
  bat
  fzf
  xclip
  clang-tools
  python3
  rustup
  thunderbird
  vital
  linuxsampler
  spotify
  pdfgrep
  musescore
  ripgrep
  jq
  slack
  discord
  chromium
  obs-studio
]) ++ ( # stuff from github
  let repos = [
    {
      owner = "ludviggunne";
      repo = "rmc";
      rev = "baa79fbc4247bae644652c3e8303a015c914a0fd";
      sha256 = "sha256-kW1F5fgDb4nTOXN+AzKueTbbkphp50tr8RZiNcyabYw=";
    }
    {
      owner = "ludviggunne";
      repo = "git-commands";
      rev = "1ae8558159f61e451754c374ec1f8fb8b0097deb";
      sha256 = "sha256-TpHkvNkDsfkjhfI6jsLP/DLc4+mkgT1YKbv1NBmBKxs=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
) ++ ( # scripts
  let scripts = [
    {
      path = ./extra/git-fzf.sh;
      name = "git-fzf";
    }
    {
      path = ./extra/pdfind.sh;
      name = "pdfind";
    }
    {
      path = ./extra/spotify-play-pause.sh;
      name = "spotify-play-pause";
    }
  ];
  in map (script: pkgs.writeShellScriptBin script.name (builtins.readFile script.path)) scripts
)
