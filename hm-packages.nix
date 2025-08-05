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
      rev = "234809dffbc66ab23f841fcff80599fd54fb02b4";
      sha256 = "sha256-XPaFNYMrG4hyb/p19YBGGeTj9zp89hGFzb8wditeCd4=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
) ++ ( # scripts
  let scripts = [];
  in map (script: pkgs.writeShellScriptBin script.name (builtins.readFile script.path)) scripts
) ++ ( # unstable stuff
  let nixpkgs-unstable = import <nixpkgs-unstable> {}; in
  with nixpkgs-unstable; [
    helix
    ghostty
  ]
)
