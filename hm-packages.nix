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
  zsh
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
  qbittorrent
  vlc
  termdown
  hub
  bat
  gh
  gh-dash
  gh-notify
  fzf
  xclip
  ccls
  python3
]) ++ ( # stuff from github
  let repos = [
    {
      owner = "ludviggunne";
      repo = "rmc";
      rev = "a6863900c276ad6f2c91c8465eef594abb07f360";
      sha256 = "sha256-fQqWTlGjDZnTICNqaWFHEJx2QtHe36LukjD/JEvr5BE=";
    }
  ];
  in map (repo: pkgs.callPackage (pkgs.fetchFromGitHub repo) {}) repos
) ++ ( # scripts
  let scripts = [
    {
      path = ./extra/git-fzf.sh;
      name = "git-fzf";
    }
  ];
  in map (script: pkgs.writeShellScriptBin script.name (builtins.readFile script.path)) scripts
)
