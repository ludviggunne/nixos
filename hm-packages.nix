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
  git-extras
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
      rev = "14b79bdae2cec520f67ed631a91e0ab8f554dd4d";
      sha256 = "sha256-EXQ+oNsexuxxXEygYa/ZKq734o1jMz63IdNjFmnUcQ4=";
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
  ];
  in map (script: pkgs.writeShellScriptBin script.name (builtins.readFile script.path)) scripts
)
