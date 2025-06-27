{
  pkgs,
}:

(with pkgs; [ # nixpkgs
  alacritty
  qutebrowser
  curl
  wget
  git
  pass
  evince
  tmux
  libreoffice
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
  spotifyd
  prismlauncher
  strawberry
  blender
  moreutils
  vlc
  termdown
  bat
  fzf
  xclip
  clang-tools
  python3
  rustup
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
  ranger
  audacity
  unzip
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
      rev = "0a4bab81468fd1fc1457bb529943bcc5fe3354a8";
      sha256 = "sha256-GKiEFprL/2BUHqscp292jHIEmK0AGnBKoD6//loCd3I=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
) ++ ( # scripts
  let scripts = [
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
) ++ ( # unstable stuff
  let nixpkgs-unstable = import <nixpkgs-unstable> {}; in
  with nixpkgs-unstable; [
    helix
    ghostty
  ]
)
